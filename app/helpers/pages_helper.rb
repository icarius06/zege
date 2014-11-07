module PagesHelper
	def get_routes
		routes= Rails.application.routes.routes
	end

	def valid_route controller_path
		if controller_path.include?"devise" or controller_path.include?"rails"
			return false
		else
			return true
		end
	end
end