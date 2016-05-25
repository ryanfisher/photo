require 'rails_helper'

describe Profile::AlbumsController, type: :controller do
  describe 'GET index' do
    let(:user)   { double(:user, albums: albums) }
    let(:albums) { double(:albums, covers: [])   }

    before do
      expect(subject).to receive(:user) { user }
    end

    before { get :index, profile_id: 'kylo-ren' }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
