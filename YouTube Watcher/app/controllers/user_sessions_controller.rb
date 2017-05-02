class UserSessionsController < ApplicationController
  skip_before_action :ensure_logged_in, except: :destroy

  def new
  end

  def create
    user = User.find_by(email: user_session_params[:email].downcase)
    if user && user.authenticate(user_session_params[:password])
      log_in(user)
      redirect_to :root
    else
      flash.now[:danger] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    log_out
    flash[:notice] = 'You have been logged out.'
    redirect_to new_user_session_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
