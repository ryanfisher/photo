module Api
  class AlbumsController < ApplicationController
    # TODO: Study csrf
    skip_before_action :verify_authenticity_token

    def index
      render json: albums
    end

    def create
      render json: new_album, status: :created
    end

    private

    def new_album
      current_user.albums.create(params.permit(:title))
    end

    def albums
      Album.limit(40)
    end
  end
end
