require 'rails_helper'

describe Api::AlbumsController, type: :controller do
  let(:user) { double(:user) }

  before do
    expect(request.env['warden']).to receive(:authenticate!) { user }
  end

  describe 'GET index' do
    before { get :index }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'POST create' do
    let(:albums) { double(:albums) }

    before do
      expect(controller).to receive(:current_user) { user }
      expect(user).to receive(:albums) { albums }
      expect(albums).to receive(:create)
    end

    before { post :create }

    it 'should respond with 201' do
      expect(response.status).to be 201
    end
  end
end
