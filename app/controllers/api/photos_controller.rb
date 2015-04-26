module Api
  class PhotosController < ApplicationController
    def index
      render json: photos
    end

    private

    def photos
      Photo.limit(40)
    end
  end
end
