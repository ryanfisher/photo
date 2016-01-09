require 'rails_helper'

describe ErrorsController, type: :controller do
  describe 'GET routing' do
    before { get :routing, path: 'not-a-real-path' }

    it 'responds with 404' do
      expect(response.status).to be 404
    end

    it 'renders the 404 template' do
      expect(response).to render_template 'errors/404'
    end
  end
end
