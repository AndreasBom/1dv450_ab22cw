class Position < ActiveRecord::Base
  has_many :events

  validates :latitude, :longitude, numericality: true

end
