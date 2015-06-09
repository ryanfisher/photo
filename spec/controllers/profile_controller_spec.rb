describe ProfileController, type: :controller do
  describe 'GET show' do
    let(:profile)  { double(:profile) }
    let(:photos)   { double(:photos)  }
    let(:albums)   { double(:albums)  }
    let(:username) { 'hansolo'        }

    before do
      expect(User).to receive(:find_by_username).with(username) { profile }
      expect(profile).to receive(:photos) { photos }
      expect(profile).to receive(:albums) { albums }
    end

    before { get :show, id: username }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
