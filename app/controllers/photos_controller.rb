# Controller for the photos
class PhotosController < ApplicationController
  def index
    photos = PhotoPresenter::Collection.new(Photo.limit(40))
    render locals: { photos_json: photos.to_json }
  end

  def show
    render locals: { photo_json: Photo.find(params.fetch(:id)).to_json }
  end
end
