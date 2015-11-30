class AddCoverPhotoIdToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :photo, index: true
    add_foreign_key :albums, :photos
  end
end
