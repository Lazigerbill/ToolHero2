class RegistartionsController < Devise::RegistartionsController
	protected

	def after_sign_up_path_for(user)
		'/views/dashboards/index'
	end

	
end
