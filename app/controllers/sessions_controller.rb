class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email_address])
    if user
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = 'Login successful!'
    else
      redirect_to login_path
      flash[:danger] = 'Login failed. Please, try again.'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
