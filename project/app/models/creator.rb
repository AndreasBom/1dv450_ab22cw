class Creator < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_many :events

  validates :creatorname, :email, presence: true
  validates :creatorname, :email, length: {maximum: 50}
  validates :creatorname, uniqueness: true



  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
