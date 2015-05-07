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
    photo.file = file_stream
    photo.save
  end

  private

  attr_reader :file_stream
end
