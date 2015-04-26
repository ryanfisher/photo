class AddAlbumsTable < ActiveRecord::Migration
  def change
    create_table :albums do |table|
      table.string :title

      table.timestamps null: false
    end
  end
end
