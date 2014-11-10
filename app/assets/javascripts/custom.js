/*
 *
 *This function llows a fan to follow an artist 
 *posts to the create function in the followers controller
 *
 */

(function($) {
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
}) (jQuery);