# frozen_string_literal: true

# ApplicationController class
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys:
                                        %i[email
                                           name
                                           password
                                           password_confirmation])
  end
end
