describe ProfileController, type: :controller do
  describe 'GET show' do
    let(:email)     { ' jon@nightswatch.com '         }
    let(:profile)   { double(:profile, email: email)  }
    let(:photo)     { double(:photo)                  }
    let(:presenter) { double(:presenter, to_json: {}) }
    let(:photos)    { [photo]                         }
    let(:username)  { 'hansolo'                       }

    before do
      expect(User).to receive(:find_by_username).with(username) { profile }
      expect(profile).to receive(:photos) { photos }
      expect(PhotoPresenter).to receive(:new) { presenter }
    end

    before { get :show, id: username }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
