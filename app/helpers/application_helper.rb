module ApplicationHelper
	# 予約可能な日はボタンから予約情報へリンクメソッド
	def vacancy_link(status)
		if status == "◯"
			link_to status, "" ,style: "color: red;"
		else
			status
		end
	end

	def edit_link(button, date, hotel)
		reservation_calendar = ReservationCalendar.find_by(select_date: date)
		if button == "削除"
			link_to button, hotel_reservation_calendar_path(reservation_calendar.hotel.id, 
				reservation_calendar.id), method: :delete, style: "color: red;"
		else
			link_to button, hotel_add_date_path(hotel_id: hotel.id, select_date: date), 
			method: :post, style: "color: blue;"
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

 	# 過去の宿泊者数
 	def guest_total(hotel)
 		if hotel.reservations.presence
 			guest_total = hotel.reservations.pluck(:guest_count).inject(:+)
 		else
 			result = 0
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

 	# admin権限 review(delete)
 	def admin_delete (admin, id)
 		if user_signed_in? && (current_user.admin_flg == true)
 			link_to "削除", review_path(id), method: :delete, class: "btn btn-danger"
 		end
 	end

 	# 営業開始宣言
	def run_if(active)
		if active == "run"
			link_to "宿泊不可にする", edit_hotel_path(@hotel), class: "btn btn-success"
		else active == "stop"
			link_to "宿泊可能にする", edit_hotel_path(@hotel), class: "btn btn-danger"
		end
	end


end
