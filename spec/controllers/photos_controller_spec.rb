require 'rails_helper'

describe PhotosController, type: :controller do
  describe 'GET index' do
    before { get :index }

    it 'responds with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'GET show' do
    let(:user) do
      User.create!(
        email: 'kylo@firstorder.com',
        password: 'ihatehansolo',
        password_confirmation: 'ihatehansolo'
      )
    end
    let(:photo) do
      Photo.create(
        file_key: '123456',
        url: '/photo',
        user_id: user.id
      )
    end

    context 'when the photo exists' do
      before { get :show, id: photo.id }

      it 'responds with 200 OK' do
        expect(response.status).to be 200
      end
    end

    context 'when the photo does not exist' do
      before do
        Photo.delete_all
        get :show, id: 1
      end

      it 'responds with 404 Not found' do
        expect(response.status).to be 404
      end
    end
  end
end
