# Manager app for backend
class ManageController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
