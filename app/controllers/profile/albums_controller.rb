module Profile
  class AlbumsController < ProfileController
    def index
      render 'albums/index', locals: { albums: user.albums.covers }
    end
  end
end
