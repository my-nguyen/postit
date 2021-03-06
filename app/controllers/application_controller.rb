class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_post
  around_filter :user_time_zone, if: :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_post
    @current_post ||= Post.find_by_slug(session[:post_id]) if session[:post_id]
  end

  def sign_in(user)
    session[:user_id] = user.id if user.present?
  end

  def sign_out
    session[:user_id] = nil
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
