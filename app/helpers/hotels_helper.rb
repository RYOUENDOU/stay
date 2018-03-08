module HotelsHelper
	# 過去の宿泊者数
 	def guest_total(hotel)
 		if hotel.reservations.presence
 			guest_total = hotel.reservations.pluck(:guest_count).inject(:+)
 		else
 			result = 0
 		end
	end

	# アメニティ無のボーダーをつけるメソッド
	def del_tag_if(t,amenity)
		if t == false
	     content_tag(:del, amenity)
	 	else
	 	   amenity
 		end
 	end

 	# jsカレンダー選択不可日
 	def count(hotel)
 		@count = @reservation_calendar.pluck(:select_date)
		@count = @count.select{|c| c  > Date.today }
		@out =  @count.map{|c|(c+1).strftime('%Y-%m-%d') }
		@count = @count.map{|c| c.strftime('%Y-%m-%d') }
		@count = @count + @out
		@count = @count.to_json.html_safe
 	end

end
