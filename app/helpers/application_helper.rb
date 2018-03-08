module ApplicationHelper
 	# admin権限 review(delete)
 	def admin_delete (admin, id)
 		if user_signed_in? && (current_user.admin_flg == true)
 			link_to "削除", review_path(id), method: :delete, class: "btn btn-danger"
 		end
 	end

 	#header owner 権限
 	def myhotel(user_id)
		myhotel = Hotel.find_by(owner_id: user_id)
		if myhotel.presence && current_user.admin_flg != true
			link_to "俺の空き家", hotel_path(id: myhotel.id), class: "nav-link" 
		end			
 	end

 	def myreservation(user_id)
 		myhotel = Hotel.find_by(owner_id: user_id)
 		if myhotel.presence && current_user.admin_flg != true
 			link_to "予約一覧へ", hotel_reservations_path(myhotel), class: "nav-link"
 		end
 	end

 	# 営業開始宣言
	def run_if(active)
		if active == "run"
			link_to "宿泊不可にする", edit_hotel_path(@hotel), class: "btn btn-success"
		else active == "stop"
			link_to "宿泊可能にする", edit_hotel_path(@hotel), class: "btn btn-warning"
		end
	end


end
