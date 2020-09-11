import consumer from "./consumer";

const initChatCable = () => {
  
  if (document.getElementById('messages')) {
    const input = document.getElementById('message_content');
    const id = document.getElementById('messages').dataset.chatId;
    consumer.subscriptions.create({ channel: "ChatChannel", id: id }, {
      received(data) {
        input.value = "";
        input.focus();
        if (document.getElementById('messages')) {
          document.getElementById('messages').insertAdjacentHTML('beforeend', data);
          const message = document.querySelector('.message-container:last-child');
          if (document.getElementById('messages') && document.getElementById('messages').dataset.userId != message.dataset.senderId ) {
            // fetch para marcar msg como lida
            const csrfToken = document.head.querySelector("[name='csrf-token']").content;
            fetch(message.dataset.markPath, { method: "post", headers: { "X-CSRF-Token": csrfToken }});
            console.log("mensagem de outro");          
          }
        }  
      },
    });
  }
}

export { initChatCable };
