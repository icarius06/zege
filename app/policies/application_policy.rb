class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
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
              return true
            else
              return false
            end
          end  
      end
    end
  end
end

