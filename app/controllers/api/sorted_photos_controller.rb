module Api
  class SortedPhotosController < Api::ApplicationController
    def update_positions
      # TODO: Simplify
      positions = params.fetch(:positions)
      (0...positions.size).each do |index|
        position = positions.fetch(index.to_s)
        SortedPhoto.where(position.permit(:album_id, :photo_id))
          .update_all(position.permit(:position))
      end

      render json: {}, status: :ok
    end
  end
end
