
import "bootstrap";
import Chartkick from "chartkick";
window.Chartkick = Chartkick;
import Chart from "chart.js";
Chartkick.addAdapter(Chart);


setDropDown()

function setDropDown() {


  let button  = document.querySelector("#navbar-wagon-menu")

  button.addEventListener( "click", function() {
    let modal = document.querySelector(".dropdown-menu")
    console.log(modal.style.display)
    if( modal.style.display == "block" ) {
      modal.style.display  = "none"
    } else {
      modal.style.display  = "block"
    }
  })

}


hideSidebarMenu()

function hideSidebarMenu() {

  let arrow = document.querySelector("#left-sidebar-toggle-left-arrow")

  arrow.addEventListener( "click", function() {
    let sbm = document.querySelector(".left-sidebar")
    // sbm.classList.toogle("hide");
    sbm.classList.remove("d-md-block");

  })

}
