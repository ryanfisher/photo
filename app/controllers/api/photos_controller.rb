module Api
  # Api controller for user photos
  class PhotosController < Api::ApplicationController
    def index
      render json: photos
    end

    def show
      render json: user_photos.find(params.fetch(:id))
    end

    def create
      photo = processed_photo
      if photo
        render json: photo
      else
        # TODO: Respond with a useful error message
        render json: {}, status: :unprocessable_entity
      end
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
      user_photos.order(created_at: :desc)
        .paginate(page: params[:page], per_page: params[:per_page])
    end

    def photo
      @_photo ||= user_photos.new
    end

    def processed_photo
      processor = PhotoProcessor.new(photo, params.fetch(:file))
      result = processor.process
      result ? processor.photo : false
    end

    def user_photos
      current_user.photos
    end
  end
end
