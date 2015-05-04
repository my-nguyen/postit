class PostsController < ApplicationController
  def new
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description,
     :cat_news, :cat_programming, :cat_education, :cat_sports, :cat_humor)
  end
end
