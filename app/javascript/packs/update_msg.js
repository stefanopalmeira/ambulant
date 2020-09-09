const updateMessage = () => {
  const checkButton = document.getElementById('button-seller-home');
  const checkMsg = document.querySelector('.btn-msg');
  const checkNoMsg = document.querySelector('.btn-no-msg')
  if (checkButton) {
    const sellerUrl = document.getElementById('seller-view').dataset.sellerUrl;
    setInterval(()=>{
      fetch(sellerUrl, { headers: { accept: 'application/json' } })
        .then(response => response.json())
        .then(jsonResponse => {
          if (checkMsg) {            
          checkMsg.innerHTML = `Mensagens: ${jsonResponse['msg']}`;
          }
          if (checkNoMsg) {            
            if (jsonResponse['msg'] > 0) {              
            checkNoMsg.innerHTML = `Mensagens: ${jsonResponse['msg']}`;
            checkNoMsg.classList.add('btn-danger');
            checkNoMsg.classList.remove('btn-secondary');
            const msgLink = document.createElement('a');
              msgLink.setAttribute('href', checkButton.dataset.chatUrl)
              msgLink.classList.add('btn');
              msgLink.classList.add('btn-danger');
              msgLink.classList.add('btn-msg');
              checkButton.appendChild(msgLink);
              checkNoMsg.remove();
            }
          }
        });
    }, 10000)
  }
}

export { updateMessage };
