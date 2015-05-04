class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      sign_in(user)
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
