class ProfilesController < ApplicationController
  def index
    render locals: { users: User.order(updated_at: :desc).limit(40) }
  end
end
