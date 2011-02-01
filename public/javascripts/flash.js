// Copy the snippet that applies to you, and paste it in application.js





// jQuery -------------------------------------------------------------

$(document).ready(function() {
  setTimeout(hideFlashes, 25000);
});

var hideFlashes = function() {
  $('p.notice, p.warning, p.error').fadeOut(1500);
}
// --------------------------------------------------------------------