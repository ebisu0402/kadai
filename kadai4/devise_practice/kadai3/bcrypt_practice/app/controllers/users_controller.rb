class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

def create
  @user = User.new(user_params)
  puts "DEBUG: #{@user.inspect}"
  if @user.save
    log_in @user
    redirect_to mypage_path, notice: "サインアップしました！"
  else
    puts "DEBUG ERRORS: #{@user.errors.full_messages}"
    render :new, status: :unprocessable_entity
  end
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
