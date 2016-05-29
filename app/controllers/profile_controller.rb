class ProfileController < ApplicationController
  layout 'profile'

  def show
    redirect_to profile_albums_path(profile_id: params[:id])
  end

  def recent
    render locals: { photos_json: photos.to_json }
  end

  private

  def user
    @_user ||= User.find_by_username(params[:id] || params[:profile_id])
  end

  def gravatar
    user.gravatar
  end

  def photos
    user.photos.map { |photo| PhotoPresenter.new(photo).to_json }
  end

  helper_method :gravatar, :user
end
