class AddOptimizedUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :optimized_url, :string
  end
end
