class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      # redirect to username instead of id, due to pretty URL
      redirect_to user_path(@user.username)
    else
      render "new"
    end
  end

  def index
    @users = User.all
  end

  def show
    # Find by username instead of id, due to pretty URL
    @user = User.find_by_username(params[:id])
    if @user
      @posts = @user.posts
    else
      render file: 'public/500.html'
    end
  end

  def edit
    @user = User.find_by_username(params[:id])
  end

  def update
    @user = User.find_by_username(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end
end
