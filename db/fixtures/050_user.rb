# Admin User
User.seed do |user|
	user.id = 1
	user.email = "admin@stay.com"
	user.password = 123456
	user.admin_flg = true
end

# User
User.seed do |user|
	user.id = 2
	user.email = "user@stay.com"
	user.password = 123456
	user.admin_flg = false
end

