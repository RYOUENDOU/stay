class CreateHotelImages < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_images do |t|
      t.string :title
      t.string :image_id
      t.string :hotel_id
      t.timestamps
    end
  end
end
