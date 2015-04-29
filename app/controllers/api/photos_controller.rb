module Api
  # Api controller for user photos
  class PhotosController < ApplicationController
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
      Photo.new
    end
  end
end
