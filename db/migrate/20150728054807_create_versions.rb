class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :photo, null: false
      t.integer :type, null: false, default: 0
      t.string :url, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.string :note

      t.timestamps null: false
    end
  end
end
