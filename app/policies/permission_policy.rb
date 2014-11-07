class PermissionPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @permission = model
    @permissions = current_user.permissions
    @controller ="permissions"
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

private
  def has_access_to(active_module) 
    page = Page.where('contoller_name=? AND action_name=?',@controller,active_module).first
    @permissions.each do |permission| 
      if page.security_level_id==permission.level_id || @current_user.admin?
        return true
      else
        return false
      end
    end
  end
end