class Review < ApplicationRecord
	belongs_to :hotel
	attachment :profile_image
	validates_presence_of :profile_image
	validates :nickname, presence: true
	validates :star, presence: true
	validates :review, presence: true
end
