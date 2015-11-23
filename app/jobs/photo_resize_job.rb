class PhotoResizeJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    @photo = Photo.find(args[0]['photo_id'])
    resize photo.url
    upload
  end

  private

  attr_reader :photo

  def resize(url)
    # TODO: The logic needs to change so we're not concerned with protocol here
    image = MiniMagick::Image.open("http:#{url}")
    image.resize 'x350'
    image.write tempfile
  end

  def upload
    PhotoUploader.upload(tempfile, photo.thumb_file_path)
  end

  def tempfile
    @_tempfile ||= Rails.root.join(
      'tmp',
      'resized_photos',
      SecureRandom.hex,
      photo.original_filename
    )
  end
end
