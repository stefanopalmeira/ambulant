const updateMessage = () => {
  const checkButton = document.getElementById('button-seller-home');  
  if (checkButton) {
    const sellerUrl = document.getElementById('seller-view').dataset.sellerUrl;
    setInterval(()=>{
      fetch(sellerUrl, { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then(jsonResponse => {
        const checkMsg = document.querySelector('.btn-msg');
        const checkNoMsg = document.querySelector('.btn-no-msg')
        if (checkMsg) {
          checkMsg.innerHTML = `Mensagens: ${jsonResponse['msg']}`;
        }
        if (checkNoMsg) {            
          if (jsonResponse['msg'] > 0) {              
              if (checkNoMsg) { checkNoMsg.remove(); }
              else { checkMsg.remove(); }
              const msgLink = document.createElement('a');
              msgLink.innerHTML = `Mensagens: ${jsonResponse['msg']}`;
              msgLink.setAttribute('href', checkButton.dataset.chatUrl)
              msgLink.classList.add('btn');
              msgLink.classList.add('btn-danger');
              msgLink.classList.add('btn-msg');
              checkButton.appendChild(msgLink);
            }
          }
        });
    }, 10000)
  }
}

export { updateMessage };
