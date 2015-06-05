module Api
  # Api controller for user photos
  class PhotosController < ApplicationController
    # TODO: Study csrf
    skip_before_action :verify_authenticity_token

    def index
      render json: photos
    end

    def show
      render json: user_photos.find(params.fetch(:id))
    end

    def create
      render json: processed_photo
    end

    def update
      params.fetch(:public_tags, []).each do |name|
        photo_by_id.tags << Tag.where(name: name).first_or_create
      end
      render json: photo_by_id
    end

    def destroy
      photo_by_id.destroy
      head :no_content
    end

    private

    def photo_by_id
      @_photo_by_id ||= user_photos.find(params.fetch(:id))
    end

    def photos
      user_photos.limit(40)
    end

    def photo
      @_photo ||= user_photos.new
    end

    def processed_photo
      processor = PhotoProcessor.new(photo, params.fetch(:file))
      processor.photo
    end

    def user_photos
      current_user.photos
    end
  end
end
