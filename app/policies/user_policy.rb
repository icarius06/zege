class UserPolicy <ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
    @permissions = current_user.permissions
    @controller ="users"
  end

  def index?
    return has_access_to("index")
  end

  def show?
    return has_access_to("show") #or @current_user == @user
  end

  def update?
    @current_user.admin?
  end
  
  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

end
