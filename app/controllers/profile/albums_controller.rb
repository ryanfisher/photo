module Profile
  class AlbumsController < ProfileController
    def index
      @body_class = 'profile'
      render 'albums/index', locals: { albums: user.albums.covers }
    end
  end
end
