//public/javascripts/application.js

// This sets up the proper header for rails to understand the request type,
// and therefore properly respond to js requests (via respond_to block, for example)
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

jQuery(document).ready(function() {

  // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

});


// Jquery : Toggle DIV called "toggleSection"
$(document).ready(function() {
      $('#toggleButton').click(function() {
          if (!$('#toggleSection').is(":hidden")) {
              $('#toggleSection').slideUp("slow");
          } else $('#toggleSection').slideDown("slow");
          return false;
      });
});




// Jquery : Autocomplete
jQuery(function($){//on document ready
  //autocomplete
  $('input.autocomplete').each(function(){
    var input = $(this);
    input.autocomplete(input.attr('data-autocomplete-url'),{
      matchContains:1,//also match inside of strings when caching
      // mustMatch:1,//allow only values from the list
      // selectFirst:1,//select the first item on tab/enter
      removeInitialValue:0//when first applying $.autocomplete
    });
  });
});

// Jquery : Calendar datepicker (non obstrusive)
 jQuery(function (){
     $('#tasklist_due_date').datepicker();
 });
