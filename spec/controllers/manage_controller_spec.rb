require 'rails_helper'

describe ManageController, type: :controller do
  describe 'GET index' do
    it 'responds with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
