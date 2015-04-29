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
end
