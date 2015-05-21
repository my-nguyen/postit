class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # Create a new Post
    @post = current_user.posts.build(post_params)
    # Make sure to generate a slug as well
    @post.slug = @post.title.downcase.gsub(" ", "-")
    if @post.save
      # If save was sucessful, then redirect to the Post#index view
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
    # Save the id/slug of the Post, so the Post can be retrieved later from
    # inside a Comment
    session[:post_id] = params[:id]
    # Find by slug and not by id
    @post = Post.find_by_slug(params[:id])
  end

  def destroy
  end

  def vote
    # Pretty URL enforced; so must look up Post by slug instead of by id
    @post = Post.find_by_slug(params[:id])
    if @post
      # Attempt to create a new vote that's linked to the current post and
      # current user
      vote = @post.post_votes.build(user_id: current_user.id)
      if vote.save
        # Increase or decreate the vote count accordingly. Note the param value
        # is passed as a string ("true" or "false") and not as a bool
        @post.vote_count += (params[:vote] == "true" ? 1 : -1)
        @post.save
      end
    end
    redirect_to(posts_path)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description,
     :news, :programming, :education, :sports, :humor)
  end
end
