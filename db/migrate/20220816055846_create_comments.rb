class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :post_comment
      t.references :user, null: false, foreign_key: true
      t.references :car_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
