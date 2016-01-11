require 'rails_helper'

describe RootController, type: :controller do
  describe 'GET index' do
    before { get :index }

    it 'redirects to the albums page' do
      expect(response).to redirect_to albums_path
    end
  end
end
