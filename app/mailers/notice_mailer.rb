class NoticeMailer < ApplicationMailer

  default from: "stay@booking.com"

  def mail_confirm(reservation)
  	@reservation = reservation
    mail to: "endorietta@gmail.com",
    	 subject: "ご予約ありがとうございます。"
  end

  def owner_request(user)
	  	mail to: "endorietta@gmail.com",
    	 subject: "管理者からの連絡及び、必要な手続き完了後に登録されます"
  end

end
