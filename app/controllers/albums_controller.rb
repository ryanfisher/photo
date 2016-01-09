class AlbumsController < ApplicationController
  caches_action :index, cache_path: Proc.new {
    { updated_at: Album.maximum(:updated_at) }
  }
  caches_action :show, cache_path: Proc.new { |controller|
    { updated_at: controller.album.updated_at }
  }

  def index
    render locals: { albums: albums.covers }
  end

  def show
    render locals: { album: album }
  end

  protected

  def album
    AlbumPresenter.new(Album.find(params.fetch(:id)))
  end

  def albums
    profile_id ? User.find_by(username: profile_id).albums : Album
  end

  def profile_id
    @_profile_id ||= params[:profile_id]
  end
end
