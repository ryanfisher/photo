# Manager app for backend
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
