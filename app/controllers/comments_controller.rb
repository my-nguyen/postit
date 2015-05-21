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

  def vote
    @comment = Comment.find(params[:comment_id])
    if @comment
      vote = @comment.comment_votes.build(user_id: current_user.id)
      if vote.save
        @post.vote_count += (params[:vote] == "true" ? 1 : -1)
        @post.save
      end
    end
    redirect_to(posts_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
