const showMenu = ()=>{
  const logo = document.getElementById("dropdownmenu");
  const menu = document.getElementById("logoaction");
  if (logo){
    logo.addEventListener("click", (event)=>{
      event.preventDefault();
      menu.classList.toggle("display-none");
    });
    }
}

export { showMenu };
