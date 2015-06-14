class AlbumPresenter < BasePresenter
  def to_json
    photos.map { |photo| PhotoPresenter.new(photo).to_json }.to_json
  end
end
