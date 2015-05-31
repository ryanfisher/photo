class RemoveExtraColumnsFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :url
    remove_column :photos, :key
    remove_column :photos, :thumbnail_url
    remove_column :photos, :thumbnail_key
    remove_column :photos, :optimized_url
    remove_column :photos, :optimized_key
  end
end
