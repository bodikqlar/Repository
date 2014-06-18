// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap.min
//= require_tree .


 $(function() {
 	
 $('.sortable').sortable({
axis: 'y',
update: function() {
return $.post($(this).data('update-url'), $(this).sortable('serialize'));
}
});
    $( ".sortable" ).disableSelection();

    
$("#users a, #users .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
$("#admins a, #admins .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });


// $("#products_search input").bind('textchange', function(){
// 	var search_input = $("#products_search input").val();

// 	if (search_input.length>2 && search_input.length<15){
// 		 $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
//     return false;
// 	}
// });
  // $("#products_search input").keyup(function() {
  //   $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
  //  return false;
  // });


 
$('.products_search input').bind('textchange', function () {

var input_search = $("#search").val();

if (input_search.length > 2 )
{
 $.get($(".products_search").attr("action"), $(".products_search").serialize(), null, "script");
   return false; 

}

});

  });
