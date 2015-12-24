class AlbumsController < ApplicationController
  caches_action :index, cache_path: Proc.new {
    { updated_at: Album.maximum(:updated_at) }
  }
  caches_action :show, cache_path: Proc.new { |controller|
    { updated_at: controller.album.updated_at }
  }

  def index
    render locals: { albums: Album.covers }
  end

  def show
    render locals: { album: album }
  end

  protected

  def album
    AlbumPresenter.new(Album.find(params.fetch(:id)))
  end
end
