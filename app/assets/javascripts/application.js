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
var selected1="";
var selected2="";

function alreadyChosen(id)
{
alert("Cannot Choose "+id+". Player is already selected!")
return;
}

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
   idNumber = this.name;

   var source = this.src;
   if(ident == selected1 || ident == selected2)
	{
		if(activeOneSet)		
		alreadyChosen(ident);
		else
		alreadyChosen(ident);
		return;
	}
	if(activeOneSet)
   {   	
		$("#playerOneSelectImg").attr("src", source);
		$("#playerOneSelectImg").attr("name", idNumber);
      $("#playerOneSelectText").text(ident);
      $("#playerOneSelect").css("background-color", "transparent");
 		$("#playerOneSelect").css("opacity", "1.0");
		selected1 = ident;
	}
   else
	{
		$("#playerTwoSelectImg").attr("src", source);
		$("#playerTwoSelectImg").attr("name", idNumber);
		$("#playerTwoSelectText").text(ident);
		$("#playerTwoSelect").css("background-color", "transparent");
		$("#playerTwoSelect").css("opacity", "1.0");
		selected2 = ident;	
	}	
});
$("#goLeaderButton").click(function()
{	
	window.location.href = "/players";
});


$("#goGameButton").click(function()
{
	
	window.location.href = "/game/"+ $("#playerOneSelectImg").attr("name") +"/"+ $("#playerTwoSelectImg").attr("name");
});

$(".newClickable").click(function()
{
	var source = this.src;
	$(".newClickable").css("border","0px");
	$(this).css("border", "2px solid yellow");
	$("#player_avatar").attr("value", source);
});

});
