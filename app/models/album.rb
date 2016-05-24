class Album < ActiveRecord::Base
  has_many :sorted_photos, dependent: :destroy
  has_many :photos, -> { order 'position' }, through: :sorted_photos
  belongs_to :user, touch: true
  belongs_to :cover_photo, class_name: 'Photo', foreign_key: 'photo_id'

  def self.covers
    joins('LEFT JOIN photos ON albums.photo_id = photos.id')
      .joins('LEFT JOIN users ON photos.user_id = users.id')
      .where.not(photo_id: nil).order(updated_at: :desc)
      .select(:id, :title, 'photos.thumb_url', 'users.username')
  end

  def update_with(hash)
    (hash.fetch(:photos) || []).each do |photo|
      next unless photo[:photo_id]
      sorted_photos.create_with(position: photos.size)
        .find_or_create_by(photo_id: photo[:photo_id])
    end
    update(title: hash[:title], cover_photo: photos.first)

    self
  end
end
