class AddSortedPhotosForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :sorted_photos, :albums
    add_foreign_key :sorted_photos, :photos
  end
end
