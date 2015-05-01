class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true

  def username=(value)
    value = value.strip.downcase
    write_attribute(:username, value)
  end
end
