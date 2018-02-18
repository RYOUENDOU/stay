class ReservationsController < ApplicationController
# before_action :authenticate_user!
	before_action :set_reservation, :only => [:show, :edit, :update, :destroy]

	def index
		
	end

	def show
	end

    def preview
		@reservation = Reservation.new(preview_params)
    	@reservation.hotel_id = params[:hotel_id]
    	@hotel = @reservation.hotel
    end	
	
	def create
		@reservation = Reservation.new(reservation_params)		
		@reservation.hotel_id = params[:hotel_id]
		@reservation.user_id = current_user.id
		if 
			@reservation.save(set_available)
		else
			flash[:notice] = "予約ができませんでした"
			render action: 'preview' 
		end
		redirect_to hotel_reservation_path(@reservation.hotel_id, @reservation)
	end


	def destroy
		
	end

	def edit	
	end

 	private 
  		def set_reservation
    		@reservation = Reservation.find(params[:id])
  		end 

		def preview_params
			params.require(:reservation)
			.permit(:check_in, :check_out, :guest_count)
		end	

		def reservation_params
			params.require(:reservation)
			.permit(:check_in, :check_out, :guest_count, :user_name, :address, :tel, :request, :total	 )
		end
		def set_available
			c = @reservation.check_in
			d = @reservation.check_out
			target = (c..d)
			target = target.map{|t|t.strftime('%Y-%m-%d') }
			e = @reservation.hotel
			@date  = e.reservation_calendars.pluck(:select_date)
			@date = @date.map{|d|d.strftime('%Y-%m-%d') }
			target.each do |t|
				@delete = e.reservation_calendars.find_by(select_date:t)
				if @delete.present?
					@delete.destroy
				end
			end
		end
end
