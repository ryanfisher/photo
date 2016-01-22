class PhotoResizeJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    @photo = Photo.find(args[0]['photo_id'])
    thumb_path = resize photo.url
    photo.thumb_url = upload thumb_path
    photo.save
  end

  private

  attr_reader :photo

  def resize(url)
    image = MiniMagick::Image.open(url)
    image.resize 'x350'

    image.path
  end

  def upload(image_path)
    PhotoUploader.upload(open(image_path), photo.thumb_file_path)
  end
end
