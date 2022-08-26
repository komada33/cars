class CreateCarPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :car_posts do |t|
      t.string :title
      t.text :message
      t.integer :parts_genre_id, null: false
      t.integer :user_id, null: false
      t.json :car_images

      t.timestamps
    end
  end
end
