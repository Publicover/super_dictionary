class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    if sesssion[:user_id].nil?
      redirect_to login_path, notice: "You must log in first."
    end
  end

  def logged_in?
    redirect_to login_path, notice: "You must log in to access this page" unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
