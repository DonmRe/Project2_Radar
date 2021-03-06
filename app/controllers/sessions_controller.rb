class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:login][:email].downcase)
  if user && user.authenticate(params[:login][:password])
    session[:user_id] = user.id.to_s
    redirect_to root_path, alert: "You are now in our Radar"
  else
    flash.now.alert = "Attempt failed, try again."
    render :new
  end
  end
  def destroy
    session.delete(:user_id)
    redirect_to root_path, alert: "You're off the Radar"
  end
end
