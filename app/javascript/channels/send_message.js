const sendMessage = () => {
  const form = document.getElementById('new_message');
  const input = document.getElementById('message_content');
  window.addEventListener('keydown', (event) => {
    if (form) {
    if (event.keyCode == 13) {
      event.preventDefault();
      form.submit();
      input.value = "";
      input.focus();
    }
  }
  })
}

export {sendMessage};
