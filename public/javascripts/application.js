$(function() {
  $("#issues th a, #issues .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#issues_search input").keyup(function() {
    $.get($("#issues_search").attr("action"), $("#issues_search").serialize(), null, "script");
    return false;
  });
});

// jQuery -------------------------------------------------------------

$(document).ready(function() {
  setTimeout(hideFlashes, 25000);
});

var hideFlashes = function() {
  $('p.notice, p.warning, p.error').fadeOut(1500);
}
// --------------------------------------------------------------------
