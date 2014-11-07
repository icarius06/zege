class PermissionPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @permission = model
    @permissions = current_user.permissions
    @controller ="permissions"
  end
  
  def new?
    return has_access_to("new")
  end


  def index?
    return has_access_to("index")
  end

  def show?
    return has_access_to("show")
  end

  def update?
    @current_user.admin?
  end
  
  def destroy?
    @current_user.admin?
  end

end