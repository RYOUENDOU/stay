class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.string :nickname
    	t.integer :star
    	t.text :review
    	t.string :hotel_id
      t.timestamps
    end
  end
end
