class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :hotel
	VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
	validates :guest_name, presence: true
	validates :address, presence: true
	validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }
	validates :check_in, presence: true
	validates :check_out, presence: true
	validates :guest_count, presence: true

	def total
		dif = check_out - check_in
		nights = dif.to_i
		price = Hotel.find(hotel_id).price
		nights * price
	end

	def availability # 予約確定後の宿泊不可への切り替え
		c = check_in
		d = check_out
		target = (c..d)
		target = target.map{|t|t.strftime('%Y-%m-%d') }
		e = Hotel.find(hotel_id)
		@date  = e.reservation_calendars.pluck(:select_date)
		@date = @date.map{|c|c.strftime('%Y-%m-%d') }
		@date.each do |i|
			if i == target 
				render :action => 'destroy', layout => 'reservation_calendar'
			end
		end
	end
end
