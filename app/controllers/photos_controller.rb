# Controller for the photos
class PhotosController < ApplicationController
  caches_action :index, cache_path: Proc.new {
    { updated_at: Photo.limit(40).maximum(:updated_at) }
  }
  caches_action :show, cache_path: Proc.new { |controller|
    { updated_at: controller.photo.updated_at }
  }

  def index
    photos_result = Photo.includes(:user).order(created_at: :desc).limit(40)
    photos = PhotoPresenter::Collection.new(photos_result)
    render locals: { photos_json: photos.to_json }
  end

  def show
    render locals: { photo_json: photo.to_json }
  rescue ActiveRecord::RecordNotFound => e
    render_404
  end

  protected

  def photo
    @_photo ||= Photo.find(params.fetch(:id))
  end
end
