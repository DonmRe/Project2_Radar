class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin, :authorize_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def authorize
    redirect_to login_path, alert: "Access Denied" if current_user.nil?
  end
  def is_admin
    @is_admin = User.find(session[:is_admin]) if current_user.is_admin?
  end
  def authorize_admin
    redirect_to login_path, alert: "Access Denied" unless current_user && current_user.is_admin
  end
  def unauthorize_access
    redirect_to root_path, alert: "You have attempted a restricted Access" unless current_user && current_user.is_admin
  end
end
