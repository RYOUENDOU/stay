class Hotel < ApplicationRecord
	has_many :hotel_images, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reservation_calendars, dependent: :destroy
  has_many :reviews, dependent: :destroy
	has_one :amenity, dependent: :destroy
  has_one :rule, dependent: :destroy
  
  validates :name, presence: true
  validates :summary, presence: true, length: { maximum: 500}    
  validates :address, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  

  accepts_attachments_for :hotel_images, attachment: :image
  accepts_nested_attributes_for :amenity
	accepts_nested_attributes_for :rule

	geocoded_by :address
  	after_validation :geocode, if: lambda {|obj| obj.address_changed?}

  enum hotel_type:{ 一軒屋: 1, 別荘: 2, マンション: 3, アパート: 4, シャアハウス: 5, その他: 6 }
  enum room_type:{ 貸切: 1, 個室: 2, 相部屋: 3 }
  enum active: { run: true, stop:false }

 #検索機能
  scope :hotel_search, ->(search_word){
    unless search_word.nil?
      relation.merge(relation.where("hotels . address like '%#{search_word}%'").distinct)
          .or(relation.where("hotels . name like '%#{search_word}%'").distinct)
    end
  }

  


end
