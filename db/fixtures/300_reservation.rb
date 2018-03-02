30.times do |i| # 10回繰り返す
  Reservation.seed(:id) do |reservation|
    reservation.id = i + 1 # idがずれていくように指定する
   	reservation.user_id = 2
   	reservation.hotel_id = rand(1..3)
   	reservation.total = 20000 
   	reservation.guest_count = rand(1..3)
    reservation.check_in = "Thu, 01 Mar 2018"
    reservation.check_out = "Fri, 03 Mar 2018"
   	reservation.guest_name = "David Beckham" 
   	reservation.address = "東京都渋谷区神宮前1−1"
    reservation.tel = "09012345678"    
   	reservation.request = "加湿器はございますでしょうか"    
 end
end