class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  def show
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user.email.downcase!
    @user.alias.downcase!

    if @user.save
      flash[:notice] = "Welcome to our Radar"
      redirect_to root_path
    else
      flash.now.alert = "Attempt failed. Please check your email, password and alias and try again."
      render :new
    end
  end
  def edit
  end
  def update
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :alias, :password, :password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
