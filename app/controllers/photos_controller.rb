# Controller for the photos
class PhotosController < ApplicationController
  def index
  end

  def show
  end

  private

  def photos_json
    Photo.limit(40).to_json
  end

  helper_method :photos_json
end
