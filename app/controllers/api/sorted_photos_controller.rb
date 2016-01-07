module Api
  class SortedPhotosController < Api::ApplicationController
    def destroy
      SortedPhoto.find(params.fetch(:id)).destroy
      head :no_content
    end

    def update
      position = params.fetch(:position)
      sorted_photo.update(position: position)
      Album.update(
        sorted_photo.album_id,
        photo_id: sorted_photo.photo_id
      ) if position == 0
      head :ok
    end

    private

    def sorted_photo
      @_sorted_photo ||= SortedPhoto.find(params.fetch(:id))
    end
  end
end
