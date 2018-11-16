
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
