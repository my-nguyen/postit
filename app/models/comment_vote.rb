class CommentVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  # Make sure a User can vote (up or down) on a Comment only once
  validates :user_id, uniqueness: { scope: :comment_id }
end
