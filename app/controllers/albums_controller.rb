class AlbumsController < ApplicationController
  def show
    render locals: { album: album }
  end

  private

  def album
    AlbumPresenter.new(Album.find(params.fetch(:id)))
  end
end
