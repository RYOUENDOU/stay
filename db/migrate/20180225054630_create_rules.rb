class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
    	t.integer :cancellation
    	t.time :check_in_time
    	t.time :check_out_time
    	t.boolean :smoking
    	t.boolean :pet
    	t.boolean :party
    	t.text :rule
    	t.string :hotel_id
      t.timestamps
    end
  end
end
