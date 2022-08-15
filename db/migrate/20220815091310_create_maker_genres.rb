class CreateMakerGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :maker_genres do |t|
      t.string :mname

      t.timestamps
    end
  end
end
