# Controller for the photos
class PhotosController < ApplicationController
  def index
    render locals: { photos_json: Photo.limit(40).to_json }
  end

  def show
    render locals: { photo_json: Photo.find(params.fetch(:id)).to_json }
  end
end
