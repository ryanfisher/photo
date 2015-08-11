class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :public_tags
  has_many :tags, through: :public_tags
  has_many :versions

  delegate :username, to: :user
end
