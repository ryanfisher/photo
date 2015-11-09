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
    process
  end

  attr_accessor :photo

  def process
    photo.original_filename = uploaded_file.original_filename
    photo.url = PhotoUploader.upload(uploaded_file, photo.file_path)
    photo.width, photo.height, photo.exif = width, height, mm_image.exif
    photo.size = uploaded_file.size
    photo.save
  end

  private

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

  attr_reader :uploaded_file
end
