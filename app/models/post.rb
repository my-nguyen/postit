class Post < ActiveRecord::Base
  belongs_to :user
  before_save :slug

  def to_param
    self.title
  end

  def slug
    title.downcase.gsub(" ", "-")
  end
end
