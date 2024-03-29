class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
    authorize User,"index"
  end

  def show
    @user = User.find(params[:id])
    authorize @user,"show"
  end
  
  def update
    @user = User.find(params[:id])
    authorize @user,"update"
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  
  def destroy
    user = User.find(params[:id])
    authorize user,"destroy"
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
