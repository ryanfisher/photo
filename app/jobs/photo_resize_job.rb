class PhotoResizeJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Photo.find(args[0]['photo_id']).create_sized_images
  end
end
