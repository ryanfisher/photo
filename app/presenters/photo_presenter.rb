class PhotoPresenter < BasePresenter
  delegate :username, to: :user

  class Collection < PresenterCollection
    def initialize(photos)
      @presenters = photos.map { |photo| PhotoPresenter.new(photo) }
    end

    def to_json
      @presenters.map(&:to_json).to_json
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
      url: optimized_url || url,
      thumb_url: thumb_url,
      created_at: created_at
    }
  end
end
