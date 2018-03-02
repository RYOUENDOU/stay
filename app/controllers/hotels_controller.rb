class HotelsController < ApplicationController
	before_action :set_admin, except: [:index, :show]
 	before_action :set_hotel, only: [:show, :edit, :update, :destroy]

	def index
		@hotels = Hotel.all.hotel_search(params[:search_word].presence)
		.page(params[:page]).per(12)
					  
		
		@hash = Gmaps4rails.build_markers(@hotels) do |hotel, marker|
		      	marker.lat hotel.latitude
		      	marker.lng hotel.longitude
		      	marker.infowindow hotel.summary
		      	marker.json({title: hotel.name})
		end
	end
	def show 
		@reservation_calendar = @hotel.reservation_calendars
		@reviews = @hotel.reviews.order("created_at DESC")
						 		 .page(params[:page]).per(5)
		#予約フォーム
		@reservation = Reservation.new
		# jsカレンダー選択不可日
		@count = @reservation_calendar.pluck(:select_date)
		@count = @count.map{|c| c.strftime('%Y-%m-%d') }
		@count = @count.to_json.html_safe
	end

	def new
		@hotel = Hotel.new
		@hotel.build_amenity
		@hotel.build_rule
	end

	def create
		@hotel = Hotel.new(hotel_params) 
		 if 
		 	@hotel.save
		 else
		 	render 'new'
		 end
		 redirect_to hotel_path (@hotel)
	end

	def edit
			
	end
	
	def update
		if @hotel.update(update_hotel_params)
			redirect_to hotel_path
		else
			render :edit
		end			
	end
	
	def destory
		if @hotel.destroy(update_hotel_params)
			redirect_to home_path
		else
			render :edit
		end	
	end


	private
		def set_admin
			current_user.admin_flg == true
		end
	
		def set_hotel
			@hotel = Hotel.find(params[:id])
		end

		def hotel_params
	    	params.require(:hotel).permit(
	        :hotel_type, :room_type, :accomodate,
	        :bedroom, :bathroom, :listing_name,
	        :summary, :address, :name, :price, :active, hotel_images_images: [],
	        amenity_attributes: [:is_tv, :is_kitchen,
	        :is_air, :is_parking, :is_internet], rule_attributes: [:cancellation, :check_in_time,
	        :check_out_time, :smoking, :pet, :party, :rule], reservation_calendares_attributes:[:select_date])
	  	end	
		def update_hotel_params
	    	params.require(:hotel).permit(
	        :hotel_type, :room_type, :accomodate,
	        :bedroom, :bathroom, :listing_name,
	        :summary, :address, :name, :price, :active, hotel_images_images: [],
	        amenity_attributes: [:id, :_destroy, :is_tv, :is_kitchen,
	        :is_air, :is_parking, :is_internet], rule_attributes: [:id, :_destroy, :cancellation, :check_in_time,
	        :check_out_time, :smoking, :pet, :party, :rule], reservation_calendares_attributes:[:select_date])
	  	end	


end
