# Controller for the photos
class PhotosController < ApplicationController
  def index
    render locals: { photos_json: photos.to_json }
  end

  def show
    render locals: { photo_json: Photo.find(params.fetch(:id)).to_json }
  end

  private

  def photos
    Photo.limit(40).map { |photo| PhotoPresenter.new(photo).to_json }
  end
end
