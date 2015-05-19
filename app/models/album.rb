class Album < ActiveRecord::Base
  has_many :sorted_photos
  has_many :photos, -> { order 'position' }, through: :sorted_photos
  belongs_to :user

  def update_with(hash)
    hash.fetch(:photos).each do |photo|
      sorted_photos.find_or_create_by(photo_id: photo[:id])
        .update(position: photo[:position])
    end
    self.title = hash[:title]
    save

    self
  end
end
