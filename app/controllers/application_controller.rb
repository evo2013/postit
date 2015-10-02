class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  
  def current_user
    #memoization: if current user exists, DO NOT run code on right side
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #turns any object into boolean value
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "Must be logged in to do that."
      redirect_to root_path
    end
  end
end
