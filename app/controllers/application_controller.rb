class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :set_user
  # before_action :set_current_user

  # def set_current_user
  #   User.current = current_user
  # end

  def authenticate
    if sesssion[:user_id].nil?
      redirect_to login_path, notice: "You must log in first."
    end
  end

  def logged_in?
    unless session[:user_id]
      redirect_to login_path, notice: "You must log in to access this page"
    end
  end

  # def s_j_signup
    # response = HTTParty.post('https://samueljohnsonapi.herokuapp.com/signup',
    #   :body => {
    #       "name" => "#{@current_user.name}",
    #       "email" => "#{@current_user.email}",
    #       "password" => "#{@current_user.password}"
    #     }
    #   )
    # @current_user.s_jregistered = true
    # @current_user.token = response['auth_token']
  # end
  #
  # def s_j_check_auth
    # unless @current_user.s_jtoken
    #   response = HTTParty.post("https://samueljohnsonapi.herokuapp.com/auth/login",
    #     :body => {
    #       "name": "#{@current_user.name}",
    #       "email": "#{@current_user.email}",
    #       "password": "#{@current_user.password}"
    #     })
    #   @current_user.s_jtoken = response['auth_token']
    # end
  # end

  # def current_user
  #   @current_user ||= User.find(session[:user_id])
  # end

  # protected
  # def set_user
  #   UserInfo.current_user = session[:user]
  # end
  # def set_current_user
  #   User.current = current_user
  # end
  def disable_nav
    @disable_nav = true
  end
end
