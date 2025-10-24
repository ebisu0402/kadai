class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user  # session[:user_id] = user.id が内部で呼ばれること
      redirect_to mypage_path, notice: 'ログイン成功'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが一致しません'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
