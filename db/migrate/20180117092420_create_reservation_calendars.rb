class CreateReservationCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_calendars do |t|
      t.date :select_date
      t.string :hotel_id
      t.boolean :status, default: true, null: false
      t.timestamps
    end
  end
end
