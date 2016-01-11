require 'rails_helper'

describe ProfilesController, type: :controller do
  describe 'GET index' do
    before { get :index }

    it 'should respond OK' do
      expect(response.status).to be 200
    end
  end
end
