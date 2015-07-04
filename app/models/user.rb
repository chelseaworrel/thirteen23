class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates :avatar, presence: true
  has_attachment :avatar, accept: [:png]
  validates :avatar, presence: true


  def to_param
    "#{self.username}"
  end
end

# attr_accessible :name
# has_attachments :photos, :maximum => 1
