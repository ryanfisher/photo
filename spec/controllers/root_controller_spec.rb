require 'rails_helper'

describe RootController, type: :controller do
  describe 'GET index' do
    before { get :index }

    it 'redirects to the photo page' do
      expect(response).to redirect_to photos_path
    end
  end
end
