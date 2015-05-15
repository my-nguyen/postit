class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  has_many :posts
  has_many :post_votes

  def to_param
    self.username
  end

  def username=(value)
    value = value.strip.downcase
    write_attribute(:username, value)
  end
end
