class ReservationsController < ApplicationController
before_action :authenticate_user!, only: [:preview, :show, :create]
before_action :set_reservation, only: [:show, :edit, :update, :destroy]
#before_action :correct_date?, only: [:preview]
	def index
		if current_user.admin_flg == true
			@reservations = Reservation.all.order("created_at DESC")
								   	   .page(params[:page]).per(30)
		else
			@hotel = Hotel.find(params[:hotel_id])
			@reservations = @hotel.reservations.order("created_at DESC")
		end                                    .page(params[:page]).per(10)
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def preview
		@reservation = Reservation.new(preview_params)
		@reservation.hotel_id = params[:hotel_id]
		@hotel = @reservation.hotel
		a = @reservation.check_in
		b = @reservation.check_out
		c = @reservation.guest_count
		if (a && b && c).present?
			bb = @hotel.reservation_calendars.find_by(select_date:b)
				if bb.nil?
					b = b - 1
				end
			target = (a..b).map{|t|t.strftime('%Y-%m-%d') }
			c = @hotel.reservation_calendars.pluck(:select_date)
			c = c.map{|t|t.strftime('%Y-%m-%d') }
			target.each do |t|
				if c.exclude?(t)
				redirect_to hotel_path(@hotel), danger: '日付が不正です。' and return
				end	
			end 
		else	
			redirect_to hotel_path(@hotel), danger: '項目を入力してください。'
		end
	end	

	def create
		@reservation = Reservation.new(reservation_params)		
		@reservation.hotel_id = params[:hotel_id]
		@reservation.user_id = current_user.id
		if @reservation.save 
			set_available
			#メールの送信機能
			NoticeMailer.mail_confirm(@reservation).deliver_now
			redirect_to hotel_reservation_path(@reservation.hotel_id, @reservation), success: "予約が完了しました。"
		else
			render 'preview', danger:  "予約ができませんでした"
		end
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
			.permit(:check_in, :check_out, :guest_count, :guest_name, :address, :tel, :request, :total)
		end

		def correct_date?
			binding.pry
		end
		
		def set_available #チェックアウト日を残すメソッドに変更
			c = @reservation.check_in
			d = @reservation.check_out
			target = (c..d)
			target = target.map{|t|t.strftime('%Y-%m-%d') }
			e = @reservation.hotel
			target.each do |t|
				@delete = e.reservation_calendars.find_by(select_date:t)
				if @delete.present?
					@delete.destroy
				end
			end
		end
	end
