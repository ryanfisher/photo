require 'rails_helper'

describe Api::PhotosController, type: :controller do
  describe 'GET index' do
    before { get :index, format: :json }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
