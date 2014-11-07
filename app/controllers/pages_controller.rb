class PagesController < ApplicationController
	  before_filter :authenticate_user!
	  after_action :verify_authorized


	  def index
	    @pages = Page.all
	    authorize Page
	  end

	  def show
	    @page = Page.find(params[:id])
	    authorize @page
	  end

	  def update
	    @page = Page.find(params[:id])
	    authorize @page
	    if @page.update_attributes(secure_params)
	      redirect_to pages_path, :notice => "Page updated."
	    else
	      redirect_to pages_path, :alert => "Unable to update permission."
	    end
	  end

	  def destroy
	    page = Page.find(params[:id])
	    authorize page
	    page.destroy
	    redirect_to pages_path, :notice => "Page deleted."
	  end

	  private

	  def secure_params
	    params.require(:page).permit(:controller_name,:action_name)
	  end
end
