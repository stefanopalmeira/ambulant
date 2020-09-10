import consumer from "./consumer";

const initChatCable = () => {
  const messagesContainer = document.getElementById('messages');
  const input = document.getElementById('message_content');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatId;
    consumer.subscriptions.create({ channel: "ChatChannel", id: id }, {
      received(data) {
        input.value = "";
        input.focus();
        messagesContainer.insertAdjacentHTML('beforeend', data);
        const message = document.querySelector('.message-container:last-child');
        if (messagesContainer && messagesContainer.dataset.userId != message.dataset.senderId ) {
          // fetch para marcar msg como lida
          const csrfToken = document.head.querySelector("[name='csrf-token']").content;
          fetch(message.dataset.markPath, { method: "post", headers: { "X-CSRF-Token": csrfToken }});
          console.log("mensagem de outro");          
        }
      },
    });
  }
}

export { initChatCable };
