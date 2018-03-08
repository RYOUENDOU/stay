class NoticeMailer < ApplicationMailer

  default from: "stay@booking.com"

  def mail_confirm(reservation)
  	@reservation = reservation
    mail to: "endorietta@gmail.com",
    	 subject: "ご予約ありがとうございます。"
  end
  end
