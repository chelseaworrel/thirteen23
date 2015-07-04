class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true

  def to_param
    "#{self.username}"
  end
end
