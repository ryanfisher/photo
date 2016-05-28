class AddThemeRefToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :theme, index: true, foreign_key: true
  end
end
