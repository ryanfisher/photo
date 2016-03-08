require 'rails_helper'

describe Api::SortedPhotosController, type: :controller do
  let(:sorted_photo) { double(:sorted_photo) }
  let(:user)         { double(:user)         }

  before do
    expect(request.env['warden']).to receive(:authenticate!) { user }
    allow(controller).to receive(:current_user) { user }
    expect(SortedPhoto).to receive(:find) { sorted_photo }
  end

  describe 'DELETE destroy' do
    before do
      expect(sorted_photo).to receive(:destroy)
      delete :destroy, id: 17
    end

    it 'responds 204' do
      expect(response.status).to be 204
    end
  end

  describe 'PUT update' do
    before do
      expect(sorted_photo).to receive(:update)
      expect(sorted_photo).to receive(:album_id)
      expect(sorted_photo).to receive(:photo_id)
      expect(Album).to receive(:update)
    end

    before { put :update, id: 17, position: 0 }

    it 'responds 200' do
      expect(response.status).to be 200
    end
  end
end
