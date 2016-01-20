class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :name
      t.string :encrypted_access_key_id
      t.string :encrypted_secret_access_key
      t.integer :provider

      t.timestamps null: false
    end
  end
end
