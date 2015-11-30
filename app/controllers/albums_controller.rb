class AlbumsController < ApplicationController
  def index
    render locals: { albums: Album.covers }
  end

  def show
    render locals: { album: album }
  end

  private

  def album
    AlbumPresenter.new(Album.find(params.fetch(:id)))
  end
end
