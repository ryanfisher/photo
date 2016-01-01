module Api
  class SortedPhotosController < Api::ApplicationController
    def destroy
      SortedPhoto.find(params.fetch(:id)).destroy
      head :no_content
    end

    def update
      SortedPhoto.find(params.fetch(:id))
        .update(position: params.fetch(:position))
      head :ok
    end
  end
end
