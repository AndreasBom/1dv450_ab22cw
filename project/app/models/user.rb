class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_many :apis
  has_and_belongs_to_many :roles

  validates :first_name, :last_name, :email, presence: true
  validates :email, email: true
  validates :first_name, :last_name, length: {maximum: 50}
  validates :email, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

end
