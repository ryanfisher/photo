class AddPositionColumnToSortedPhotos < ActiveRecord::Migration
  def change
    add_column :sorted_photos, :position, :integer
  end
end
