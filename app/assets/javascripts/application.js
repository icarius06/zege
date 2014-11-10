// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require custom.js
//= require_tree .


$(document).ready(function() {
	/*
	changes actions based on controller 
    */
  $("#page_path").change(function(e){
  	e.preventDefault();
    
  	var controller_name = $(this).val().split('#')[0];
  	var action_name = $(this).val().split('#')[1];

  	if (action_name=="new"){
  		alert("Users in this level will be able to add "+action_name+" "+controller_name);	
  	}
  	else{
  		alert("Users in this level will be able to "+action_name+" "+controller_name);
  	}
	
  	$("#page_controller_name").val(controller_name)
  	$("#page_action_name").val(action_name)
  });
});


