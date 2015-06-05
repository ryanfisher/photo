class RenamePhotoTagsTableToPublicTags < ActiveRecord::Migration
  def change
    rename_table :photo_tags, :public_tags
  end
end
