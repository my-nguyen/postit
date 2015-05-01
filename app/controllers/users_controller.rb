class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome, you've logged in."
      sign_in(@user)
      logger.debug("NGUYEN: save() successful!")
      redirect_to root_url
    else
      logger.debug("NGUYEN: save() failed!")
      render "new"
    end
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
