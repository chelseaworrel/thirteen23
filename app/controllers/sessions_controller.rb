class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to username_path(@user)
      else
        flash.now[:danger] = "Invalid login"
        render :new
      end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:notice] = "Goodbye"
  end
end
