class PostVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  # Make sure a User can vote (up or down) on a Post only once
  validates :user_id, uniqueness: { scope: :post_id }
end
