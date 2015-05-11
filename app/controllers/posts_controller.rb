class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.slug = @post.title.downcase.gsub(" ", "-")
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

  def show
    @post = Post.find_by_slug(params[:id])
    @comment = @post.comments.build
  end

  def destroy
  end

  def vote
    render params
    increase = up ? 1 : -1
    @post = Post.find_by_slug(params[:id])
    @post.votes += increase
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description,
     :news, :programming, :education, :sports, :humor)
  end
end
