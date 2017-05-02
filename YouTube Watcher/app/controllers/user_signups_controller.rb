class UserSignupsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    unless @user.save
      render :edit
      return
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
