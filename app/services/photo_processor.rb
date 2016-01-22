require 'securerandom'

# Processes photos for storage
class PhotoProcessor
  # Takes a photo and processes it for storage and display
  #
  # @param [Photo]
  # @param [ActionDispatch::Http::UploadedFile]
  #
  # @constructor
  def initialize(photo, uploaded_file)
    @photo = photo
    @uploaded_file = uploaded_file
  end

  attr_accessor :photo

  def process
    return false if photo_exists?
    photo.original_filename = uploaded_file.original_filename
    photo.upload(uploaded_file)
    set_attributes
    photo.save
  end

  private

  def set_attributes
    photo.signature = photo_signature
    photo.width, photo.height, photo.exif = width, height, mm_image.exif
    photo.size = uploaded_file.size
  end

  def mm_image
    @_mm_image ||= MiniMagick::Image.new(uploaded_file.path)
  end

  def dimensions
    @_dimensions ||= mm_image.dimensions
  end

  def width
    dimensions[0]
  end

  def height
    dimensions[1]
  end

  def photo_signature
    @_photo_signature ||= mm_image.signature
  end

  def photo_exists?
    Photo.exists?(signature: photo_signature, user: photo.user)
  end

  attr_reader :uploaded_file
end
