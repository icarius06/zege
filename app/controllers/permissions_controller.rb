class PermissionsController < ApplicationController
	  before_filter :authenticate_user!
	  after_action :verify_authorized

	  def index
	    @permissions = Permission.all
	    authorize Permission
	  end

	  def show
	    @permission = Permission.find(params[:id])
	    authorize @permission
	  end

	  def update
	    @permission = Permission.find(params[:id])
	    authorize @permission
	    if @permission.update_attributes(secure_params)
	      redirect_to permissions_path, :notice => "Permission updated."
	    else
	      redirect_to permissions_path, :alert => "Unable to update permission."
	    end
	  end

	  def destroy
	    permission = Permission.find(params[:id])
	    authorize permission
	    permission.destroy
	    redirect_to permissions_path, :notice => "Permission deleted."
	  end

	  private

	  def secure_params
	    params.require(:permission).permit(:level_id,:user_id)
	  end
end
