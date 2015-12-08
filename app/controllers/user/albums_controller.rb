module Profile
  class AlbumsController < ApplicationController
    def index
      render locals: { albums: user.albums.covers }
    end

    private

    def user
      @_user ||= User.find_by_username(params.fetch(:id))
    end
  end
end
