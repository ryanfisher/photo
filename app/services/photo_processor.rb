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
    upload_location = PhotoUploader.upload(uploaded_file, photo.file_path)
    photo.versions.new url: upload_location, width: width, height: height
    photo.size = uploaded_file.size
    photo.save
  end

  private

  def dimensions
    @_dimensions ||= MiniMagick::Image.new(uploaded_file.path).dimensions
  end

  def width
    dimensions[0]
  end

  def height
    dimensions[1]
  end

  attr_reader :uploaded_file
end
