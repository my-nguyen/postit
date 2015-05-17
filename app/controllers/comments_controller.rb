class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    logger.debug "NGUYEN: #{current_post.inspect}"
    @comment = current_post.comments.build(comment_params)
    if @comment.save
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
