require 'rails_helper'

describe PhotosController, type: :controller do
  describe 'GET index' do
    before { get :index }

    it 'responds with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'GET show' do
    it 'responds with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
