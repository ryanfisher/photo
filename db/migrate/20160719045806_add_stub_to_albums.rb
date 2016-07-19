class AddStubToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :stub, :string, null: false, default: ''
  end
end
