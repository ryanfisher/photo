require 'rails_helper'

describe Api::PhotosController, type: :controller do
  let(:user)   { double(:user)            }
  let(:photos) { double(:photos, new: {}) }

  before do
    expect(request.env['warden']).to receive(:authenticate!) { user }
    expect(controller).to receive(:current_user) { user }
    expect(user).to receive(:photos) { photos }
  end

  describe 'GET index' do
    before do
      expect(photos).to receive(:limit)
    end

    before { get :index, format: :json }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'GET show' do
    let(:photos) { double(:photos) }

    before do
      expect(photos).to receive(:find) { {} }
    end

    before { get :show, id: 1 }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'POST create' do
    let(:processor) { double(:processor, photo: {}) }

    before do
      expect(PhotoProcessor).to receive(:new) { processor }
    end

    before { post :create, file: '' }

    it 'should responds with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'PUT update' do
    let(:id)    { 17.to_s                    }
    let(:tags)  { double(:tags)              }
    let(:photo) { double(:photo, tags: tags) }
    let(:name)  { 'arbys'                    }
    let(:tag)   { double(:tag)               }

    before do
      expect(photos).to receive(:find).with(id) { photo }
      expect(Tag).to receive(:where).with(name: name) { tag }
      expect(tag).to receive(:first_or_create) { tag }
      expect(tags).to receive(:<<).with(tag)
    end

    before { put :update, id: id, public_tags: [name] }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end

  describe 'DELETE destroy' do
    let(:id)    { 17.to_s        }
    let(:photo) { double(:photo) }

    before do
      expect(photos).to receive(:find).with(id) { photo }
      expect(photo).to receive(:destroy)
    end

    before { delete :destroy, id: id }

    it 'should respond with 204 No content' do
      expect(response.status).to be 204
    end
  end
end
