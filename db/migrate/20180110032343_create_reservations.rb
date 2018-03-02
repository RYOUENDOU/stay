class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer  :user_id
  	  t.integer  :hotel_id
      t.integer  :total
      t.integer  :guest_count
  	  t.date  :check_in, null: false
      t.date :check_out, null: false
      t.string :guest_name
      t.string :address
      t.string :tel
      t.text :request
      t.timestamps
    end
  end
end
