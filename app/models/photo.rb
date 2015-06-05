class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :file, PhotoUploader

  has_many :public_tags
  has_many :tags, through: :public_tags
end
