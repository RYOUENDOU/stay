class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.string :nickname
    	t.string :profile_image_id
    	t.integer :star
    	t.text :review
    	t.string :hotel_id
      t.timestamps
    end
  end
end
