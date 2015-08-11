require 'securerandom'

# Processes photos for storage
class PhotoProcessor
  # Takes a photo and processes it for storage and display
  #
  # @param [Photo]
  # @param [FileStream] # TODO: Determine what sort of object this should be
  #
  # @constructor
  def initialize(photo, file_stream)
    @photo = photo
    @file_stream = file_stream
    process
  end

  attr_accessor :photo

  def process
    # Save file stream with random file name
    photo.versions.new url: PhotoUploader.upload(file_stream, file_path)
    photo.size = file_stream.size
    photo.save
  end

  private

  def file_path
    [
      :photos,
      photo.username,
      SecureRandom.hex,
      file_stream.original_filename
    ].join('/')
  end

  attr_reader :file_stream
end
