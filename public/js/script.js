$(document).ready(function(){
  $("a.new_window").attr("target", "_blank");
  
  $("#menuTabs li a").click(function(){
      $(this).parent('li').find('a').removeClass('active');
      $(this).addClass('active');
  });
 });