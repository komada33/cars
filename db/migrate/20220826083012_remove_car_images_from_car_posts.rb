class RemoveCarImagesFromCarPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :car_posts, :car_images, :json
  end
end
