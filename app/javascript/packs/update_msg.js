const updateMessage = () => {
  const checkButton = document.getElementById('button-seller-home');
  const checkMsg = document.querySelector('.btn-msg');
  if (checkButton) {
    const sellerUrl = document.getElementById('seller-view').dataset.sellerUrl;
    setInterval(()=>{
      fetch(sellerUrl, { headers: { accept: 'application/json' } })
        .then(response => response.json())
        .then(jsonResponse => {
          if (checkMsg) { 
          checkMsg.innerHTML = `Mensagens: ${jsonResponse['msg']}`;
          }        
        });
    }, 10000)
  }
}

export { updateMessage };
