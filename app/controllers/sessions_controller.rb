class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
    else
      flash.now[:errors] = "Invalid login credentials. Please try again"
      render login_path
    end
  end

  def destroy
    session.clear
    redirect_to users_path
  end
end
