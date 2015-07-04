class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
    # @user = User.find_by(id: params[:username])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to username_path(@user)
    else
      flash[:danger] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :location, :email)
  end
end
