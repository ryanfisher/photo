require 'rails_helper'

describe Api::AlbumsController, type: :controller do
  let(:user)   { double(:user)   }
  let(:albums) { double(:albums) }

  before do
    expect(request.env['warden']).to receive(:authenticate!) { user }
    allow(controller).to receive(:current_user) { user }
    expect(user).to receive(:albums) { albums }
  end

  describe 'GET index' do
    before do
      expect(albums).to receive(:limit)
    end

    before { get :index }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'POST create' do
    before do
      expect(albums).to receive(:create)
    end

    before { post :create }

    it 'should respond with 201' do
      expect(response.status).to be 201
    end
  end

  describe 'PUT update' do
    let(:album) { double(:album) }

    before do
      expect(albums).to receive(:find).with('1') { album }
      expect(album).to receive(:update_with)
    end

    before do
      put :update, id: 1, title: 'title', photos: [{ id: 2 }, { id: 4 }]
    end

    it 'should respond with 200' do
      expect(response.status).to be 200
    end
  end
end
