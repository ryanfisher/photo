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
    let(:photos)    { double(:photos, new: {})      }
    let(:processor) { double(:processor, photo: {}) }

    before do
      expect(controller).to receive(:current_user) { user }
      expect(user).to receive(:photos) { photos }
      expect(PhotoProcessor).to receive(:new) { processor }
    end

    before { post :create, file: '' }

    it 'should responds with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
