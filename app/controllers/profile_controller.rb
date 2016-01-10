class ProfileController < ApplicationController
  layout 'profile'

  def show
    render locals: { photos_json: photos.to_json }
  end

  private

  def user
    @_user ||= User.find_by_username(params[:id] || params[:profile_id])
  end

  def gravatar
    Digest::MD5.hexdigest(user.email.strip.downcase)
  end

  def photos
    user.photos.map { |photo| PhotoPresenter.new(photo).to_json }
  end

  helper_method :gravatar, :user
end
