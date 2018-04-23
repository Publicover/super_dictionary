class UsersController < ApplicationController
  before_action :disable_nav
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  # def self.current
  #   Thread.current[:user]
  # end
  #
  # def self.current=(user)
  #   Thread.current[:user] = user
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
