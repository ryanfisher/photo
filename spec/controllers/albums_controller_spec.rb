require 'rails_helper'

describe AlbumsController, type: :controller do
  describe 'GET show' do
    let(:album) { double(:album) }
    let(:id)    { 17.to_s        }

    before do
      expect(Album).to receive(:find).with(id) { album }
    end

    before { get :show, id: id }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
