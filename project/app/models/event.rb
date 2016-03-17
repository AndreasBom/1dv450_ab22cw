class Event < ActiveRecord::Base
  belongs_to :creator
  belongs_to :position, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :message, length: {maximum: 250}
  validates :name, length: {maximum: 50}
  validates :rating, length: {in: 1..5}
end
