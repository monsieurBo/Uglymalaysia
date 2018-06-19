class Device < ApplicationRecord
	reverse_geocoded_by :latitude, :longitude,
	  :address => :location
	after_validation :reverse_geocode
end