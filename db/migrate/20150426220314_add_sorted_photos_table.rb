class AddSortedPhotosTable < ActiveRecord::Migration
  def change
    create_table :sorted_photos do |table|
      table.integer :photo_id
      table.integer :album_id

      table.timestamps null: false
    end
  end
end
