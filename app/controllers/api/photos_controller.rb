module Api
  # Api controller for user photos
  class PhotosController < ApplicationController
    # TODO: Study csrf
    skip_before_action :verify_authenticity_token

    def index
      render json: photos
    end

    def create
      render json: processed_photo
    end

    private

    def photos
      Photo.limit(40)
    end

    def photo
      @_photo ||= current_user.photos.new
    end

    def processed_photo
      processor = PhotoProcessor.new(photo, params.fetch(:file))
      processor.photo
    end
  end
end
