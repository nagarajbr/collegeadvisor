class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
#  before_action :set_logged_in_user_in_audit_module
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def set_logged_in_user_in_audit_module
	  AuditModule.set_current_user=(current_user)
  end

end
