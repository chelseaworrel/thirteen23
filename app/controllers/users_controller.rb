class UsersController < ApplicationController
  before_action(:set_user, only: [:update])

  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
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

  def update
    if @user.update(user_params)
      # flash.notice = "Profile '#{@user.name}' Updated!"
      redirect_to username_path(@user)
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :location, :email, :avatar)
  end

  def set_user
    @user = User.find_by_username(params[:id])
  end
end
