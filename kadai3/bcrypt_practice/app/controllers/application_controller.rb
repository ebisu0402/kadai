class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to root_path, alert: "ログインしてください" unless logged_in?
  end
end
