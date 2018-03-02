class ReservationCalendarController < ApplicationController
	before_action :set_reservation_calendar, only: [:edit, :update]
	
	def index
		@hotel = Hotel.find(params[:hotel_id])
		@reservation_calendar = @hotel.reservation_calendars
		# カレンダーのフォーマット定義
		 @today = Date.today
    	 from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    	 to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    	 @calendar_data = from_date.upto(to_date)
	end

	def add_date
		@reservation_calendar = ReservationCalendar.new
	    @reservation_calendar.hotel_id = params[:hotel_id] 
		@reservation_calendar.select_date = params[:select_date]
	    if @reservation_calendar.save
        	redirect_to hotel_reservation_calendar_index_path, notice: '予約カレンダーに登録されました'
      	else
        render :new
      	end
	end

	def new
		@hotel = Hotel.find(params[:hotel_id])
		@reservation_calendar = ReservationCalendar.new
	end

	def create
	  @reservation_calendar = ReservationCalendar.new(reservation_calendar_params)
	  @reservation_calendar.hotel_id = params[:hotel_id] 
      if @reservation_calendar.save
        redirect_to hotel_reservation_calendar_index_path, notice: '予約カレンダーに登録されました'
      else
        render :new
      end
    end

	def update
		if @reservation_calendar.update(reservation_calendar_params)
        	redirect_to hotel_reservation_calendar_path, notice: '予約カレンダーは更新されました'
      	else
        	render :edit
      	end
	end

	def destroy
		@date = params[:select_date]
		@reservation_calendar = ReservationCalendar.find_by(select_date: @date)
		if @reservation_calendar.destroy
        	redirect_to hotel_reservation_calendar_index_path, notice: 'タイムテーブルは正常に削除されました'
      	else
        	redirect_to hotel_reservation_calendar_path, alert: '予約があるため削除できません'
      	end
	end

	private
		def set_reservation_calendar 
			@reservation_calendar = ReservationCalendar.find(params[:id])
		end

		def reservation_calendar_params
			params.require(:reservation_calendar).permit(:select_date, :status, :hotel_id)
		end
end
