setDropDownSide()
hideSidebarMenu()

function setDropDownSide(){ 


  let button  = document.querySelector(".btn-collapse")

  button.addEventListener( "click", function(event) {
    let id = event.currentTarget.dataset.id
    let modal = document.querySelector(`#submenu${id}`)
    console.log(modal.style.display)
    if( modal.style.display == "block" ) {
      modal.style.display  = "none"
    } else {
      modal.style.display  = "block"
    }
  })


}


function hideSidebarMenu() {

  let arrow = document.querySelector("#left-sidebar-toggle-left-arrow")

  arrow.addEventListener( "click", function() {
    let sbm = document.querySelector(".left-sidebar")
    if (sbm.classList.contains("d-md-block")) {
      sbm.classList.remove("d-md-block");
    }
    else {
      sbm.classList.add("d-md-block");
    }
  })
}
