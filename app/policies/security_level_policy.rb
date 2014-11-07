class SecurityLevelPolicy <ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @security_level = model
    @permissions = current_user.permissions
    @controller ="security_levels"
  end

  def new?
    return has_access_to("index")
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