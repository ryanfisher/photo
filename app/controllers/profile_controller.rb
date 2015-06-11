class ProfileController < ApplicationController
  def show
    # TODO: Create a ProfilePresenter to manage all these locals
    render locals: {
      user: user,
      photos_json: photos.to_json,
      albums: user.albums,
      gravatar: gravatar
    }
  end

  private

  def user
    @_user ||= User.find_by_username(params.fetch(:id))
  end

  def gravatar
    Digest::MD5.hexdigest(user.email.strip.downcase)
  end

  def photos
    user.photos.map { |photo| PhotoPresenter.new(photo).to_json }
  end
end
