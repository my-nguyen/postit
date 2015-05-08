class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post was created!"
      redirect_to posts_path
    else
      render "new"
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description,
     :cat_news, :cat_programming, :cat_education, :cat_sports, :cat_humor)
  end
end
