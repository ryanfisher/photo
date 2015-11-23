class Photo < ActiveRecord::Base
  after_initialize :initialize_hex_key
  belongs_to :user

  has_many :public_tags
  has_many :tags, through: :public_tags
  has_many :versions

  # after_create :enqueue_resize

  delegate :username, to: :user

  def file_path
    [:photos, username, file_key, original_filename].join('/')
  end

  def thumb_file_path
    [:photos, username, file_key, "thumb_#{original_filename}"].join('/')
  end

  private

  def initialize_hex_key
    self.file_key ||= SecureRandom.hex
  end

  def enqueue_resize
    PhotoResizeJob.perform_later photo_id: id
  end
end
