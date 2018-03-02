30.times do |i| # 30回繰り返す
  Amenity.seed(:id) do |amenity|
    amenity.id = i + 1 # idがずれていくように指定する
    amenity.is_tv = true
    amenity.is_kitchen = true
    amenity.is_air = true
    amenity.is_internet = false
    amenity.is_parking = true
    amenity.hotel_id = i + 1    
 end
end