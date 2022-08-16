class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
