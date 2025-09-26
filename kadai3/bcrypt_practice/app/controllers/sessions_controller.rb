class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to mypage_path, notice: 'ログイン成功'
    else
      flash.now[:alert] = 'メールアドレスかパスワードが間違っています'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
