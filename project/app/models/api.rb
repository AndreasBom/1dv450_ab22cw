class Api < ActiveRecord::Base
  belongs_to :user

  validates :key, uniqueness: true
  validates :application, presence: true
end
