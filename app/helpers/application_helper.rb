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

 	# admin権限 review(delete)
 	def admin_delete (admin, id)
 		if admin.admin_flg == true
 			link_to "削除", review_path(id), method: :delete, class: "btn btn-danger"
 		end
 	end
end
