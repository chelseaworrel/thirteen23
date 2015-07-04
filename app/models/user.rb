class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_attachment :avatar, accept: [:png]
  User.order(created_at: :desc)

  def to_param
    "#{self.username}"
  end
end
