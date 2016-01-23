class Photo < ActiveRecord::Base
  after_initialize :initialize_hex_key
  belongs_to :user

  has_many :public_tags
  has_many :tags, through: :public_tags
  has_many :versions

  after_create :enqueue_resize

  after_destroy :delete_photos

  delegate :username, :bucket, to: :user

  def file_path
    [:photos, username, file_key, original_filename].join('/')
  end

  def thumb_file_path
    [:photos, username, file_key, "thumb_#{original_filename}"].join('/')
  end

  def simple_json
    { id: id, thumb_url: thumb_url }
  end

  def upload(file)
    self.url = bucket.upload(file_path, file)
  end

  def create_thumb
    image = MiniMagick::Image.open(url)
    image.resize 'x350'
    self.thumb_url = bucket.upload(thumb_file_path, open(image.path))
    save
  end

  private

  def delete_photos
    PhotoUploader.delete(file_path)
    PhotoUploader.delete(thumb_file_path)
  end

  def initialize_hex_key
    self.file_key ||= SecureRandom.hex
  end

  def enqueue_resize
    PhotoResizeJob.perform_later photo_id: id
  end
end
