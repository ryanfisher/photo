class ProfileController < ApplicationController
  def show
    render locals: { photos: user.photos, albums: user.albums }
  end

  private

  def user
    @_user ||= User.find_by_username(params.fetch(:id))
  end
end
