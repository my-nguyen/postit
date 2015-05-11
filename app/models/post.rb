class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, uniqueness: true

  def to_param
    slug
  end
end
