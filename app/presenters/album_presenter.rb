class AlbumPresenter < BasePresenter
  def to_json
    PhotoPresenter::Collection.new(photos).to_json
  end

  def simple_json
    {
      id: id,
      title: title,
      photos: photos_array
    }
  end

  def photos_array
    photos.map(&:simple_json)
  end
end
