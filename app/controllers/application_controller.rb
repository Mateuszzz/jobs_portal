class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :admin_role?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "Logout Successful!"
    redirect_to root_path
  end
  
  def admin_role?
    unless @current_user.admin?
      redirect_to current_user
    end
  end
end
