class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  validates :time_zone, inclusion: { in: ActiveSupport::TimeZone.zones_map.keys }
  has_many :posts
  has_many :comments

  # required by pretty URL
  def to_param
    username
  end

  def username=(value)
    value = value.strip.downcase
    write_attribute(:username, value)
  end
end
