module Api
  # Api controller for user photos
  class PhotosController < ApplicationController
    # TODO: Study csrf
    skip_before_action :verify_authenticity_token

    def index
      render json: photos
    end

    def create
      render json: photo
    end

    private

    def photos
      Photo.limit(40)
    end

    def photo
      current_user.photos.new
    end
  end
end
