class AlbumsController < ApplicationController
  def show
    render locals: { album: Album.find(params[:id]) }
  end
end
