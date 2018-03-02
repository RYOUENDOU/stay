class Rule < ApplicationRecord
belongs_to :hotel, optional: true

enum cancel: { 宿泊日の24時間前: 1, 宿泊日の48時間前: 2,宿泊日の72時間前: 3 } 
end
