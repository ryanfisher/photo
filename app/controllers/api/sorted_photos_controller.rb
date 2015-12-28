module Api
  class SortedPhotosController < Api::ApplicationController
    def update_positions
      params.fetch(:positions).values.each do |sorted_photo|
        SortedPhoto.where(sorted_photo.slice(:album_id, :photo_id))
          .first.update(sorted_photo.slice(:position))
      end

      render json: {}, status: :ok
    end
  end
end
