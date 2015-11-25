class PhotoResizeJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    @photo = Photo.find(args[0]['photo_id'])
    thumb_path = resize photo.url
    upload thumb_path
  end

  private

  attr_reader :photo

  def resize(url)
    # TODO: The logic needs to change so we're not concerned with protocol here
    image = MiniMagick::Image.open("http:#{url}")
    image.resize 'x350'

    image.path
  end

  def upload(image_path)
    PhotoUploader.upload(open(image_path), photo.thumb_file_path)
  end
end
