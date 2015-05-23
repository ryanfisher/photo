module Api
  class AlbumsController < ApplicationController
    # TODO: Study csrf
    skip_before_action :verify_authenticity_token

    def index
      render json: albums.as_json(include: :photos)
    end

    def show
      render json: current_user_albums.find(params[:id])
    end

    def create
      render json: new_album, status: :created
    end

    def update
      render json: update_album, status: :ok
    end

    def destroy
      current_user_albums.find(params.fetch(:id)).destroy
      head :ok
    end

    private

    def new_album
      current_user_albums.create(params.permit(:title))
    end

    def update_album
      current_user_albums.find(params.fetch(:id)).update_with(params)
        .as_json(include: :photos)
    end

    def current_user_albums
      current_user.albums
    end

    def albums
      current_user_albums.limit(40)
    end
  end
end
