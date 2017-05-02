class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_logged_in

  include UserSessionsHelper

  def ensure_logged_in
    unless logged_in?
      flash[:notice] = 'Please log in.'
      redirect_to new_user_session_path
    end
  end
end
