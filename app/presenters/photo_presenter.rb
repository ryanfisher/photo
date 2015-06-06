class PhotoPresenter < BasePresenter
  delegate :username, to: :user

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
