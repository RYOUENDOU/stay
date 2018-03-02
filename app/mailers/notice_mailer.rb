class NoticeMailer < ApplicationMailer

  default from: "stay@booking.com"

  def mail_confirm(reservation)
  	@reservation = reservation
    mail to: @reservation.user.email,
    	subject: "ご予約ありがとうございました。「@reservation.hotel.name」"
  end
end
