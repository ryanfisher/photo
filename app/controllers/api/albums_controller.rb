module Api
  class AlbumsController < ApplicationController
    def index
      render json: albums
    end

    private

    def albums
      Album.limit(40)
    end
  end
end
