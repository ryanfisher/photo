class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  force_ssl if: proc { Rails.env.production? }

  caches_action :render_404

  def render_404
    render 'errors/404', status: :not_found
  end
end
