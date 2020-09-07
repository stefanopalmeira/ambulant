import mapboxgl from 'mapbox-gl';

const buildMap = () => {
  const mapElement = document.getElementById('map');
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [-19.904443, -43.958945],
    zoom: 3
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const el = document.createElement('div');
    el.className = 'marker';
    el.style.backgroundImage = 'url(' + marker.image + ')';
    el.style.backgroundSize = 'contain';
    el.style.backgroundRepeat = 'no-repeat';
    el.style.width = marker.iconSize[0] + 'px';
    el.style.height = marker.iconSize[1] + 'px';

    el.addEventListener('click', function () {
      window.location.href = marker.url;
    });
    var currMarker = new mapboxgl.Marker(el)
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
    function animateMarker(timestamp) {
      fetch(marker.url, { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then((data) => {
        currMarker.setLngLat([
          data.lng, data.lat
        ]);
        currMarker.addTo(map);
        requestAnimationFrame(animateMarker);
      });

    } 
    requestAnimationFrame(animateMarker);
  });
};

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true
      })
    );
    navigator.geolocation.getCurrentPosition((position) => {
      const el = document.createElement('div');
      el.className = 'marker';
      el.style.backgroundImage = 'url("https://www.clipartmax.com/png/small/140-1407097_raise-hand-raise-your-hand-icon.png")';
      el.style.backgroundSize = 'contain';
      el.style.width = '30px';
      el.style.height = '30px';

      new mapboxgl.Marker(el)
        .setLngLat([position.coords.longitude, position.coords.latitude])
        .addTo(map);

      map.flyTo({
        center: [position.coords.longitude, position.coords.latitude],
        essential: true,
        zoom: 14,
        duration: 0
      })
    });
  }
};

export { initMapbox };
