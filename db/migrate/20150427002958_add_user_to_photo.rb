class AddUserToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :integer, null: false
    add_foreign_key :photos, :users
  end
end
