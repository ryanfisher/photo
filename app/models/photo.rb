class Photo < ActiveRecord::Base
  after_initialize :initialize_hex_key
  belongs_to :user

  has_many :public_tags
  has_many :tags, through: :public_tags
  has_many :versions

  after_create :enqueue_resize

  after_destroy :delete_photos

  delegate :username, :bucket, to: :user

  scope :recent,    -> { order(created_at: :desc)  }
  scope :available, -> { where.not(thumb_url: nil) }

  # TODO: Move different files to version model
  def file_path
    [:photos, username, file_key, original_filename].join('/')
  end

  def thumb_file_path
    [:photos, username, file_key, "thumb_#{original_filename}"].join('/')
  end

  def optimized_file_path
    [:photos, username, file_key, "optimized_#{original_filename}"].join('/')
  end

  def simple_json
    { id: id, thumb_url: thumb_url }
  end

  def upload(file)
    self.url = bucket.upload(file_path, file)
  end

  def create_sized_images
    create_thumb
    create_optimized
  end

  def create_thumb
    image = optimally_resize 'x350'
    self.thumb_url = bucket.upload(thumb_file_path, open(image.path))
    save
  end

  def create_optimized
    image = optimally_resize 'x1920>'
    self.optimized_url = bucket.upload(optimized_file_path, open(image.path))
    save
  end

  def update_cache_control
    file = bucket.directory.files.get(thumb_file_path)
    file.cache_control = 'max-age=604800'
    file.public = true
    file.save
  end

  private

  def optimally_resize(new_size)
    image = MiniMagick::Image.open(url)
    image.combine_options do |combined|
      combined.resize new_size
      combined.strip
      combined.quality '82'
      combined.interlace 'plane'
    end

    image
  end

  def delete_photos
    bucket.delete_file(file_path)
    bucket.delete_file(thumb_file_path)
    bucket.delete_file(optimized_file_path)
  end

  def initialize_hex_key
    self.file_key ||= SecureRandom.hex
  end

  def enqueue_resize
    PhotoResizeJob.perform_later photo_id: id
  end
end
