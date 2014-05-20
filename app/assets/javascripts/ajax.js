$(document).ready(function(){
$(".delete").click(function(){
var link=$(this);
$.ajax({
    type:"DELETE",
    url:link.attr("href")
   });
  link.parents("li").remove();


return false;
});

});
