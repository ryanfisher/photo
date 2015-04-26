class AddPhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |table|
      table.string :url
      table.string :key
      table.string :thumbnail_url
      table.string :thumbnail_key
      table.string :optimized_url
      table.string :optimized_key
      table.string :original_filename
      table.datetime :date_taken
      table.integer :width
      table.integer :height
      table.integer :size

      table.timestamps null: false
    end
  end
end
