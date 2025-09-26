class UsersController < ApplicationController
   before_action :require_login, only: [:show]
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to mjypage_path
    else
      render :new
  end

   def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    redirect_to root_path, alert: 'ログインしてください' unless logged_in?
  end
end
end