class CreatePartsGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :parts_genres do |t|
      t.string :pname

      t.timestamps
    end
  end
end
