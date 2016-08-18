class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, :if => :devise_controller?
  
  helper_method :current_community

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end

  def current_community
    @_current_community ||= begin
      Community.find_by(id: params[:community_id]) || current_user.communities.first || Community.find_by(name: 'Communities')
    end
  end
end
