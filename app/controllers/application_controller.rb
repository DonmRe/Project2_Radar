class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def authorize
    redirect_to login_path, alert: "Access Denied" if current_user.nil?
  end
  def is_admin
    @is_admin = User.find(session[:is_admin]) if current_user.is_admin?
  end
end
