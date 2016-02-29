class Position < ActiveRecord::Base
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, :reverse_geocode

  validates :latitude, :longitude, numericality: {:allow_blank => true}

  has_many :events
end

