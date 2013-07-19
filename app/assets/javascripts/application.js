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
//= require jquery_ujs
//= require_tree .

$(document).ready(function()
{
//Click on Leaderboards to view Player   
$(".leaderboard-player").click(function()
{
   var ident = this.id;
   var index = ident.indexOf("-");
   window.location.href = "/players/"+ident.substr(index+1);
});

var activeOneSet = true;
var activeTwoSet = false; 
$("#playerOneSelect").click(function()
{
  
  activeOneSet = true;
  activeTwoSet = false;
});

$("#playerTwoSelect").click(function()
{
  activeOneSet = false;
  activeTwoSet = true;
});

$(".clickableSelect").click(function()
{
	var ident = this.id;
   var index = ident.indexOf("-");
	ident = ident.substr(index+1);

   var source = this.src;
	if(activeOneSet)
   {   	
		$("#playerOneSelectImg").attr("src", source);
      $("#playerOneSelectText").text(ident);
      $("#playerOneSelect").css("background-color", "transparent");
 		$("#playerOneSelect").css("opacity", "1.0");
	}
   else
	{
		$("#playerTwoSelectImg").attr("src", source);
		$("#playerTwoSelectText").text(ident);
		$("#playerTwoSelect").css("background-color", "transparent");
		$("#playerTwoSelect").css("opacity", "1.0");
	}	
});

$("#goGameButton").click(function()
{
	
	window.location.href = "/players";
});

});
