//= require rails-ujs
//= require popper
//= require bootstrap-sprockets



//= require_tree .

document.getElementById("left-sidebar-toggle").addEventListener('click', (event) => {
  document.getElementById("js-test").classList.toggle("hide");
} );
