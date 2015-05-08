class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid username/password"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: "Logged out"
  end
end
