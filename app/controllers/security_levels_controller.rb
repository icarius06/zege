class SecurityLevelsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @security_level =SecurityLevel.new
    authorize SecurityLevel,"new"
  end

  def create
    authorize SecurityLevel,"create"
    @security_level = SecurityLevel.new(secure_params)
    
      if @security_level.save
        redirect_to security_levels_path, :notice => "security_levels added."
      else
        flash[:notice]="Not saved"
        redirect_to :action=>"new" 
      end 
  end

  def index
    @security_levels = SecurityLevel.all
    authorize SecurityLevel,"index"
  end
  
  def show
    @security_level = SecurityLevel.find(params[:id])
    @pages = @security_level.pages
    authorize @security_level,"show"
  end

  def update
    @security_level = SecurityLevel.find(params[:id])
    authorize @security_level,"update"
    if @security_level.update_attributes(secure_params)
      redirect_to security_levels_path, :notice => "SecurityLevel updated."
    else
      redirect_to security_levels_path, :alert => "Unable to update security_level."
    end
  end

  def destroy
    security_level = SecurityLevel.find(params[:id])
    authorize security_level,"update"
    security_level.destroy
    redirect_to security_levels_path, :notice => "Security Level deleted."
  end

  private

  def secure_params
    params.require(:security_level).permit(:level)
  end
end
