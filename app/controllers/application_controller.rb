class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :authorize
  
  def authorize model,action
  
  	 puts "class_name",model.to_s

  	 if (model.to_s=="User")
        if action=="index"
  	 	  	user_not_authorized unless UserPolicy.new(current_user, model).index?
        elsif action=='show'
          user_not_authorized unless UserPolicy.new(current_user, model).show?
        end	
  	 elsif (model.to_s=="Permission")
		    	user_not_authorized unless PermissionPolicy.new(current_user, model).index?
	   elsif (model.to_s=="Page")
		    	user_not_authorized unless PagePolicy.new(current_user, model).index?
	   elsif (model.to_s=="SecurityLevel")
		    	user_not_authorized unless SecurityLevelPolicy.new(current_user, model).index?
	   end
  
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
