class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  #override devise strong params
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:account_update) do |o|
  		o.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  	end
  end


end

