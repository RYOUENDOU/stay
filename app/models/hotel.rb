class Hotel < ApplicationRecord
	has_many :hotel_images, dependent: :destroy
	has_many :amenities, dependent: :destroy
	has_many :reservations
	has_many :reservation_calendars
  has_many :reviews

	accepts_attachments_for :hotel_images, attachment: :image
	accepts_nested_attributes_for :amenities

	geocoded_by :address
  	after_validation :geocode, if: lambda {|obj| obj.address_changed?}


  	def self.search(search) 
    if search
      where(['address LIKE ?', "%#{search}%"]) #検索とaddressの部分一致を表示。
    else
      all #全て表示。
    end
  end

end
