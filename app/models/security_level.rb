class SecurityLevel < ActiveRecord::Base
	has_many :pages
	has_many :permissions	
	validates :level, uniqueness: true
end