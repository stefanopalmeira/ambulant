const fetchFunction = async () => { 
  const sellerView = document.getElementById('seller-view')
  if (sellerView) {
    const sellerUrl = sellerView.dataset.sellerUrl;
    const response = await fetch(sellerUrl, { headers: { accept: 'application/json' } });
    const jsonResponse = await response.json();
    return jsonResponse;
  }
}

const createMessage = async (jsonResponse) => {
const checkButton = document.getElementById('button-seller-home');  
  if (checkButton) {
    let jsonResponse = await fetchFunction()
    let checkMsg = document.querySelector('.btn-msg');
    let checkNoMsg = document.querySelector('.btn-no-msg')
    if (checkMsg) {
      checkMsg.innerHTML = `Mensagens: ${jsonResponse['msg']}`;
    }
    if (checkNoMsg && jsonResponse['msg'] > 0) {

      if (checkNoMsg) { 
        checkNoMsg.remove();
      } else { checkMsg.remove(); }            
      let link = document.createElement('a');
      link.setAttribute('href', document.getElementById('button-seller-home').dataset.chatUrl);
      let div = document.createElement('div');
      link.appendChild(div)
      checkButton.appendChild(link)
      div.textContent = `Mensagens: ${jsonResponse['msg']}`;
      div.style.color = 'white';
      div.classList.add('btn');
      div.classList.add('btn-danger')
      div.classList.add('orange-message');
      div.classList.add('btn-msg');
    }
  }
}

function updateMessage() { setInterval( async() => {
    const jsonResponse = await fetchFunction()
    createMessage(jsonResponse); 
  }, 11000); 
}

export { updateMessage };
