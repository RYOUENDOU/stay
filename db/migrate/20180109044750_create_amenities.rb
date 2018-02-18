class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_air
      t.boolean :is_internet
      t.boolean :is_parking
      t.string :hotel_id

      t.timestamps
    end
  end
end
