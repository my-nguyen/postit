class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    # Create a new Comment
    @comment = current_post.comments.build(comment_params)
    if @comment.save
      # If save was successful, then redirect to the Post#show view, using
      # the post_id stored previously in the session variable
      redirect_to post_path(session[:post_id])
    else
      render "new"
    end
  end

  def index
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
