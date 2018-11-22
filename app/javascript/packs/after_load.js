setDropDownSide();
import { $, datepicker } from "jquery";
import { datetimepicker} from "datetimepicker";
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
  let maincont = document.querySelector(".right-maincontent")

  arrow.addEventListener( "click", function() {
    let sbm = document.querySelector(".left-sidebar")
    if (sbm.classList.contains("d-md-block")) {
      sbm.classList.remove("d-md-block");
      arrow.classList.add("fa-caret-right");
      arrow.classList.remove("fa-caret-left");
      maincont.classList.add("col-md-12");
      maincont.classList.remove("col-md-10");
    }
    else {
      sbm.classList.add("d-md-block");
      arrow.classList.add("fa-caret-left");
      arrow.classList.remove("fa-caret-right");
      maincont.classList.add("col-md-10");
      maincont.classList.remove("col-md-12");
    }
  })
}

setDropDownOptions();

function setDropDownOptions() {

  let dot  = document.querySelectorAll(".card-kpi-option")

  dot.forEach(function(item) { item.addEventListener( "click", function(event) {
    let id = event.currentTarget.dataset.toggle
    let modal = document.querySelector(`#${id}`)
    console.log(modal.style.display)
    if( modal.style.display == "block" ) {
      modal.style.display  = "none"
    } else {
      modal.style.display  = "block"
    }
  });
});

}


setDropDownComparison();

function setDropDownComparison() {

  let comp  = document.querySelectorAll(".card-kpi-comparison-perc-placeholder")
  let compblck = document.querySelectorAll(".card-kpi-comparison-block")

  comp.forEach(function(item) { item.addEventListener( "click", function(event) {
    let id = event.currentTarget.dataset.toggle
    let modal = document.querySelector(`#${id}`)
    console.log(modal.style.display)
    if( modal.style.display == "block" ) {
      modal.style.display  = "none"
    } else {
      modal.style.display  = "block"
    }
  });
});

}

