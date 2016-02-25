class Position < ActiveRecord::Base
  geocoded_by :name

  after_validation :geocode, if: :name_changed?

  validates :latitude, :longitude, numericality: {:allow_blank => true}

  has_many :events
end
