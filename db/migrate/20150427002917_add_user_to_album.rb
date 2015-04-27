class AddUserToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :user_id, :integer, null: false
    add_foreign_key :albums, :users
  end
end
