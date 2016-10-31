class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_user_path
      flash[:danger] = 'Please provide a username, password and matching confirmation and a valid email address...'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email_address)
  end
end
