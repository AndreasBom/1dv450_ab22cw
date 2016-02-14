class Tag < ActiveRecord::Base
  has_and_belongs_to_many :events

  validates :name, length: {maximum: 50}
  validates :name, presence: true
end
