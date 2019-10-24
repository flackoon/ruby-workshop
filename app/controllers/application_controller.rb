class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  helper_method :current_user
  
  def authorize
    if current_user.nil?
      redirect_to login_path
    end
  end
	
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
end
