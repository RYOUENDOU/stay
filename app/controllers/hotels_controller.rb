class HotelsController < ApplicationController
 	before_action :authenticate_user!, except: [:index, :show]
 	before_action :set_hotel, only: [:show, :edit, :update, :destroy]

	def index
		if 
		@hotels = params[:serach]
  		hotel.where(activated: true).paginate(page: params[:page]).where('address LIKE ?', "%#{params[:search]}%")
  		else
		@hotels = Hotel.all
	    end
		@hash = Gmaps4rails.build_markers(@hotels) do |hotel, marker|
		      	marker.lat hotel.latitude
		      	marker.lng hotel.longitude
		      	marker.infowindow hotel.summary
		      	marker.json({title: hotel.name})
		end
	end
	def show 
		#アメニティ
		@amenity = Amenity.find(params[:id])
		
		@reservation_calendar = @hotel.reservation_calendars
		
		#カレンダー		
		@month = params[:month_id]
		@today = Date.today+@month.to_i.month    		
    	from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    	to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    	@calendar_data = from_date.upto(to_date)
		
		#予約フォーム
		@reservation = Reservation.new
		# jsカレンダー選択不可日
		@count = @reservation_calendar.pluck(:select_date)
		@count = @count.map{|c| c.strftime('%Y-%m-%d') }
		@count = @count.to_json.html_safe
		#レビュー
		@reviews = @hotel.reviews
	end

	def new
		@hotel = Hotel.new
		@hotel.amenities.build

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
		if @hotel.update(hotel_params)
			redirect_to hotel_path
		else
			render :edit
		end			
	end
	
	def destory
		
	end


	private
		def set_hotel
			@hotel = Hotel.find(params[:id])
		end

		def hotel_params
	    	params.require(:hotel).permit(
	        :hotel_type, :room_type, :accomodate,
	        :bedroom, :bathroom, :listing_name,
	        :summary, :address, :name, :price, :active, hotel_images_images: [],
	        amenities_attributes: [:is_tv, :is_kitchen,
	        :is_air, :is_parking, :is_internet], reservation_calendares_attributes:[:select_date])
	  	end	
end
