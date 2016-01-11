class RootController < ApplicationController
  def index
    redirect_to albums_path
  end
end
