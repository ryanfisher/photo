class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :photo_tags do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :photo, index: true
      t.timestamps null: false
    end
  end
end
