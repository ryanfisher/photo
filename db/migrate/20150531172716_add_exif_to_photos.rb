class AddExifToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :exif, :hstore
  end
end
