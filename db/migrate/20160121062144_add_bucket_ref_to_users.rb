class AddBucketRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :bucket, index: true
    add_foreign_key :users, :buckets
  end
end
