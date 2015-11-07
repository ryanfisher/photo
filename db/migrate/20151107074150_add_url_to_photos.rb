class AddUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :url, :string, null: false
  end
end
