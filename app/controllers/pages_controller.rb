class PagesController < ApplicationController
	  before_filter :authenticate_user!

	 def index
	 	@pages = Page.all
	 	authorize @page,"index"
	 end

	 def new
	 	@security_level = SecurityLevel.find(params[:security_level_id])
	 	@page = @security_level.pages.build
	 	authorize @page,"new"
	 end

	 def create
	 	authorize Page,"create"
	 	@security_level =SecurityLevel.find(params[:security_level_id])

	 	controller_name = params[:path].to_s.split('#')[0]
	 	action_name = params[:path].to_s.split('#')[1]
	 	#params[:category].downcase
    	#@post = Post.new(post_params)
	 	params[:page][:controller_name] = controller_name
	 	params[:page][:action_name] = action_name

    	@page = @security_level.pages.build(secure_params)
    	
        if @page.save
      	  redirect_to @security_level, :notice => "Page added."
      	else
      	  flash[:notice]="Not saved"
      	  redirect_to :action=>"new" 
      	end 
	 end

	  def show
	    @page = Page.find(params[:id])
	    authorize @page,"show"
	  end

	  def update
	    @page = Page.find(params[:id])
	    authorize @page,"update"
	    if @page.update_attributes(secure_params)
	      redirect_to pages_path, :notice => "Page updated."
	    else
	      redirect_to pages_path, :alert => "Unable to update permission."
	    end
	  end

	  def destroy
	  	security_level = SecurityLevel.find(params[:security_level_id])
	    page = Page.find(params[:id])
	    authorize page,"destroy"
	    page.destroy

	    redirect_to security_level, :notice => "Page deleted."
	  end

	  private

	  def secure_params
	    params.require(:page).permit(:controller_name,:action_name)
	  end
end
