module Api
  class SortedPhotosController < Api::ApplicationController
    def destroy
      SortedPhoto.find(params.fetch(:id)).destroy
      head :no_content
    end

    def update_positions
      photo_positions = params.fetch(:positions).values
      ids = photo_positions.map { |pos| pos[:id] }
      positions = photo_positions.map { |pos| { position: pos[:position] } }

      SortedPhoto.update(ids, positions)

      render json: {}, status: :ok
    end
  end
end
