class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, uniqueness: true
  has_many :comments, dependent: :destroy
  has_many :post_votes, dependent: :destroy

  def to_param
    slug
  end
end
