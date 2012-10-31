class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id])
  end

  helper_method :current_user

  def user_signed_in?
    current_user
  end

  helper_method :user_signed_in?
end