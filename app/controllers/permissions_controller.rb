class PermissionsController < ApplicationController
	  before_filter :authenticate_user!

	  def new
	  	@permission = Permission.new
	  	authorize Permission,"new"
	  end

	  def create 
	  	 authorize Permission,"create"
	     @permissions = Permission.new(secure_params)
	    
	     if @permission.save
	        redirect_to permissions_path, :notice => "permission added."
	     else
	        flash[:notice]="Not assigned"
	        redirect_to :action=>"new" 
	     end 
	  end 

	  def edit
	  	@permission = Permission.find(params[:id])
	  end

	  def index
	    @permissions = Permission.all
	    authorize Permission,"index"
	  end

	  def show
	    @permission = Permission.find(params[:id])
	    authorize @permission,"show"
	  end

	  def update
	    @permission = Permission.find(params[:id])
	    authorize @permission,"update"
	    if @permission.update_attributes(secure_params)
	      redirect_to permissions_path, :notice => "Permission updated."
	    else
	      redirect_to permissions_path, :alert => "Unable to update permission."
	    end
	  end

	  def destroy
	    permission = Permission.find(params[:id])
	    authorize permission,"destroy"
	    permission.destroy
	    redirect_to permissions_path, :notice => "Permission deleted."
	  end

	  private
	  	def secure_params
	  	  params.require(:permission).permit(:level_id,:user_id)
	  	end
end
