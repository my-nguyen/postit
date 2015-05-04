class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
    logger.debug("NGUYEN, user_id: #{:user_id}, session[user_id]: #{session[:user_id]}")
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id if user.present?
  end

  def sign_out
    session[:user_id] = nil
  end
end
