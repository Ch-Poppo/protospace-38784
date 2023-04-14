class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configuure_permitted_parameters, if: :devise_controller?

  private
  def configuure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :occupation, :profile, :position ])
end
end
