class AddFileKeyToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :file_key, :string, null: false
  end
end
