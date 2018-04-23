class SessionsController < ApplicationController
  before_action :disable_nav
  def new
    # @session = Session.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # session[:email] = user.email
      # session[:johnson_registered] = user.johnson_registered
      # session[:johnson_token] = user.johnson_token
      redirect_to root_path, notice: 'You have logged in.'
    else
      flash.now[:alert] = 'Credentials incorrect.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You successfully logged out.'
  end
end
