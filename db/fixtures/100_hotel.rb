30.times do |i| # 100回繰り返す
  Hotel.seed(:id) do |hotel|
    hotel.id = i + 1 # idがずれていくように指定する
    hotel.name = "#{i + 1}番目の空き家"
    hotel.price = (i * 100) + 10000
    hotel.summary = "#{i + 1}番目の宿です。自然に囲まれたエリアで日帰り温泉も近くにございます"
    hotel.hotel_type = 1
    hotel.room_type = 1
    hotel.accomodate = 1
    hotel.bedroom = 1
    hotel.bathroom = 1
    hotel.address = "山梨県北杜市小淵沢町4000"     
    hotel.latitude = 35.1814464
    hotel.longitude = 136.906398
 end
end