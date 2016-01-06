class Album < ActiveRecord::Base
  has_many :sorted_photos, dependent: :destroy
  has_many :photos, -> { order 'position' }, through: :sorted_photos
  belongs_to :user
  belongs_to :cover_photo, class_name: 'Photo', foreign_key: 'photo_id'

  def self.covers
    joins('LEFT JOIN photos ON albums.photo_id = photos.id')
      .select(:id, :title, 'photos.thumb_url')
  end

  def update_with(hash)
    (hash.fetch(:photos) || []).each do |photo|
      next unless photo[:photo_id]
      sorted_photos.find_or_create_by(photo_id: photo[:photo_id])
    end
    self.title = hash[:title]
    save

    self
  end
end
