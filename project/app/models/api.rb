class Api < ActiveRecord::Base
  belongs_to :user

  validates :key, uniqueness: true
end
