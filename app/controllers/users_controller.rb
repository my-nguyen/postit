class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:id])
    if @user
      @posts = @user.posts
    else
      render file: 'public/500.html'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
