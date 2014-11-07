class User < ActiveRecord::Base
  has_many :permissions
  
  after_create :set_default_permission #, :if => :new_record?

  def set_default_permission
    permission = self.permissions.build
    permission.level_id = SecurityLevel.find_by_level("default").id
    permission.save
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  #these methods are meant to be created by enum 
  def admin!
    permission = self.permissions.first
    permission.level_id = SecurityLevel.find_by_level("high").id
    permission.save
  end      

  def admin?
    is_admin = false
    self.permissions.each do |permission|
        if permission.level_id==SecurityLevel.find_by_level("high").id
          is_admin = true
        else
          is_admin = false
        end
    end
    return is_admin
  end
  
end
