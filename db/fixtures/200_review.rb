10.times do |i| # 10回繰り返す
  Review.seed(:id) do |review|
    review.id = i + 1 # idがずれていくように指定する
   	review.nickname = "今日も空き家さん"
   	review.star = 5
   	review.review = "#{i + 1}番目のレビューです。"
   	review.hotel_id = 1    
 end
end