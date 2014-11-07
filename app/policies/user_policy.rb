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

private
  def has_access_to(active_module)  
    if @current_user.admin?
      return true
    else
      page = Page.where('controller_name=? AND action_name=?',@controller,active_module).first
      if page.nil?
          return false
      else
          @current_user.permissions.each do |permission|
            if permission.level_id==page.security_level_id
              return false
            else
              return true
            end
          end  
          return true
      end
    end
  end

end
