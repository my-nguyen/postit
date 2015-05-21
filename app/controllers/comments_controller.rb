class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    # Create a new Comment
    @comment = current_post.comments.build(comment_params)
    @comment.user_id = current_user.id
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

  def vote
    logger.debug("NGUYEN, params: #{params.inspect}")
    @comment = Comment.find(params[:id])
    if @comment
      logger.debug("NGUYEN, found comment: #{@comment.inspect}")
      vote = @comment.comment_votes.build(user_id: @comment.user_id)
      if vote.save
        logger.debug("NGUYEN, saved vote: #{vote.inspect}")
        @comment.vote_count += (params[:vote] == "true" ? 1 : -1)
        @comment.save
      end
    else
      logger.debug("NGUYEN, comment NOT FOUND")
    end
    redirect_to(posts_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
