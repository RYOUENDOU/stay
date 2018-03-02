30.times do |i| # 10回繰り返す
  Rule.seed(:id) do |rule|
    rule.id = i + 1 # idがずれていくように指定する
   	rule.cancellation = 1
   	rule.check_in_time = "15:00:00"
   	rule.check_out_time = "10:00:00"
   	rule.smoking = false
   	rule.pet = false
   	rule.party = false
   	rule.rule = "よる22時以降はお静かにしてください。"
   	rule.hotel_id = i + 1    
 end
end