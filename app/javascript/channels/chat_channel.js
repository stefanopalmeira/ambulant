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
      },
    });
  }
}

export { initChatCable };