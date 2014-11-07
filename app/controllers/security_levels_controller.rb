class SecurityLevelsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @security_levels = SecurityLevel.all
    authorize SecurityLevel
  end

  def show
    @security_level = SecurityLevel.find(params[:id])
    authorize @security_level
  end

  def update
    @security_level = SecurityLevel.find(params[:id])
    authorize @security_level
    if @security_level.update_attributes(secure_params)
      redirect_to security_levels_path, :notice => "SecurityLevel updated."
    else
      redirect_to security_levels_path, :alert => "Unable to update security_level."
    end
  end

  def destroy
    security_level = SecurityLevel.find(params[:id])
    authorize security_level
    security_level.destroy
    redirect_to security_levels_path, :notice => "Security Level deleted."
  end

  private

  def secure_params
    params.require(:security_level).permit(:level)
  end
end
