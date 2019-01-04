class ApplicationController < ActionController::API
  helper_method :current_user

  def current_user
    @current_lookup_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
