class ReservationCalendar < ApplicationRecord
   belongs_to :hotel
   validates :select_date, presence: true
   # validate :start_end_check

   # def start_end_check
   #  errors.add(:end_date, "の日付を正しく記入してください。") unless
   #  self.start_date < self.end_date
   # end
   
   def self.get_vacancy(date)
    model = self.pluck(:select_date)
    model.each do |select_date| 
      return result = "◯" if select_date == date
    end
      return result = "×"
   end

   def self.new_destroy(date)
    button = self.pluck(:select_date)
      button.each do |select_date|
        if (date).to_s <= (Date.today).to_s
          return result = " - "
        elsif select_date == date
          return result = "削除" 
        else select_date != date
          return result = "追加"
        end
      end
  end
end
