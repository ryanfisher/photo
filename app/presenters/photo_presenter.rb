class PhotoPresenter < BasePresenter
  delegate :username, to: :user

  class Collection < PresenterCollection
    def initialize(photos)
      @presenters = photos.map { |photo| PhotoPresenter.new(photo) }
    end

    private

    attr_reader :presenters
  end

  def to_json
    {
      id: id,
      width: width,
      height: height,
      username: username,
      file: file
    }
  end
end
