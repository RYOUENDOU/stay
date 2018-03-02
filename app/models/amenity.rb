class Amenity < ApplicationRecord
	belongs_to :hotel, optional: true
end
