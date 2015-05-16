class Album < ActiveRecord::Base
  has_many :sorted_photos
  has_many :photos, through: :sorted_photos
  belongs_to :user
end
