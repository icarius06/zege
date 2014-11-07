/*
 *
 *This function llows a fan to follow an artist 
 *posts to the create function in the followeres controller
 *
 */
$(document).ready(function() {
	/*
	changes actions based on controller 
    */
  $("#page_path").on('change',function(e){
  	var controller_name = $(this).val().split('#')[0];
  	var action_name = $(this).val().split('#')[1];

  	$("#page_controller_name").val(controller_name)
  	$("#page_action_name").val(action_name)
  });
});