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
              let msgLink = document.createElement('div');
              let msgLinkContent = document.createElement('a')
              msgLink.appendChild(msgLinkContent);
              checkButton.appendChild(msgLink);
              msgLinkContent.textContent = `Mensagens: ${jsonResponse['msg']}`;
              msgLinkContent.setAttribute('href', checkButton.dataset.chatUrl)
              msgLinkContent.style.color = 'white';
              msgLink.classList.add('btn');
              msgLink.classList.add('btn-danger')
              msgLink.classList.add('orange-message');
              msgLink.classList.add('btn-msg');
              ;
              
            }
          }
        });
    }, 10000)
  }
}

export { updateMessage };
