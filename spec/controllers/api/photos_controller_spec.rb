require 'rails_helper'

describe Api::PhotosController, type: :controller do
  let(:user) { double(:user) }

  before do
    expect(request.env['warden']).to receive(:authenticate!) { user }
  end

  describe 'GET index' do
    before { get :index, format: :json }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'POST create' do
    let(:photos) { double(:photos, new: {}) }

    before do
      expect(controller).to receive(:current_user) { user }
      expect(user).to receive(:photos) { photos }
    end

    before { post :create }

    it 'should responds with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
