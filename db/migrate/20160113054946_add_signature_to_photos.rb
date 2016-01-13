class AddSignatureToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :signature, :string
  end
end
