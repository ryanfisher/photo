module Api
  # Controller for api application
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!
  end
end
