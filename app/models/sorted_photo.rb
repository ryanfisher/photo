class SortedPhoto < ActiveRecord::Base
  belongs_to :album, touch: true
  belongs_to :photo

  validates_uniqueness_of :photo_id, scope: :album_id

  def simple_json
    {
      photo_id: photo.id,
      thumb_url: photo.thumb_url,
      id: id,
      position: position
    }
  end
end
