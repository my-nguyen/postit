class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_post.comments.build(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render "new"
    end
  end

  def index
  end
end
