class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
	    t.integer :hotel_type
      t.integer :room_type
      t.integer :accomodate
      t.integer :bedroom
      t.integer :bathroom
      t.text :name
      t.text :summary
      t.string :address
      t.integer :price
      t.boolean :active
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end
