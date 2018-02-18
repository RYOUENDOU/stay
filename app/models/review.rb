class Review < ApplicationRecord
	belongs_to :hotel
	validates :nickname, presence: true
	validates :star, presence: true
	validates :review, presence: true
end
