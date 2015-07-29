class RemoveFileFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :file
  end
end
