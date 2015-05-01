class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username]).downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are registered."
      redirect_to root_url
    else
      flash.now[:alert] = "Invalid username/password"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:notice] = "You are now signed out"
    redirect_to root_url
  end
end
