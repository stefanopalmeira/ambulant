function updateSellerLocation() {
  
  const options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };

  function success(pos) {
    const sellerView = document.getElementById("seller-view")
    if (sellerView) {
      const id = sellerView.dataset.sellerId;
      const csrfToken = document.head.querySelector("[name='csrf-token']").content;
      const params = { 
        'lat': pos.coords.latitude, 
        'long': pos.coords.longitude 
      };
      
      const url = `update_sellers/${id}?lat=${params['lat']}&long=${params['long']}`;
     
      fetch(url, {
        method: "PATCH", 
        headers: { "X-CSRF-Token": csrfToken }
      });
    }
  }

  function error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  };
  
  
  setInterval(() => { navigator.geolocation.getCurrentPosition(success, error, options) }, 5000);
}

export { updateSellerLocation };




