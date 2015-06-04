class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :file, PhotoUploader

  has_many :photo_tags
  has_many :tags, through: :photo_tags
end
