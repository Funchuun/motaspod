class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'], password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env.production?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # added_attrs = [ :name, :email, :password, :password_confirmation ]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    # devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
