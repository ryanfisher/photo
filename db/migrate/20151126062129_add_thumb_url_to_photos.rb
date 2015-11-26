class AddThumbUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :thumb_url, :string
  end
end
