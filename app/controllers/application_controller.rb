class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
#  before_action :set_logged_in_user_in_audit_module
  protected

  # def configure_permitted_parameters
  #   #devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role,:comapany_id])
  
  # end

  def set_logged_in_user_in_audit_module
	  AuditModule.set_current_user=(current_user)
  end

  protected
    # def after_sign_in_path_for(resource)
    #   @client = Client.where("upper(ltrim(last_name)) = ? and upper(ltrim(first_name)) = ?",( current_user.last_name).strip.upcase,(current_user.first_name).strip.upcase)  
    #   if @client.present?
    #     session[:student] = @client.id
    #   end
    # end

end
