setDropDownSide();

function setDropDownSide() { 

  let button  = document.querySelectorAll(".btn-collapse")

  button.forEach(function(item) { item.addEventListener( "click", function(event) {
    let id = event.currentTarget.dataset.id
    let modal = document.querySelector(`#submenu${id}`)
    console.log(modal.style.display)
    if( modal.style.display == "block" ) {
      modal.style.display  = "none"
    } else {
      modal.style.display  = "block"
    }
  });
});

}

hideSidebarMenu();

function hideSidebarMenu() {

  let arrow = document.querySelector("#left-sidebar-toggle-left-arrow")

  arrow.addEventListener( "click", function() {
    let sbm = document.querySelector(".left-sidebar")
    if (sbm.classList.contains("d-md-block")) {
      sbm.classList.remove("d-md-block");
      arrow.classList.add("fa-caret-right");
      arrow.classList.remove("fa-caret-left");
    }
    else {
      sbm.classList.add("d-md-block");
      arrow.classList.add("fa-caret-left");
      arrow.classList.remove("fa-caret-right");
    }
  })
}

setDropDownOptions();

function setDropDownOptions() {

  let dot  = document.querySelectorAll("#card-kpi-option")

  dot.forEach(function(item) { item.addEventListener( "click", function(event) {
    let modal = document.querySelector(".dropdown-more-options")
    console.log(modal.style.display)
    if( modal.style.display == "block" ) {
      modal.style.display  = "none"
    } else {
      modal.style.display  = "block"
    }
  });
});

}


