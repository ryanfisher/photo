describe ProfileController, type: :controller do
  let(:email)    { ' jon@nightswatch.com '        }
  let(:profile)  { double(:profile, email: email) }
  let(:username) { 'hansolo'                      }

  describe 'GET show' do
    before { get :show, id: username }

    it 'should redirect to the profile albums page' do
      expect(response)
        .to redirect_to profile_albums_path(profile_id: username)
    end
  end

  describe 'GET recent' do
    let(:photo)     { double(:photo)                  }
    let(:presenter) { double(:presenter, to_json: {}) }
    let(:photos)    { [photo]                         }

    before do
      expect(User).to receive(:find_by_username).with(username) { profile }
      expect(profile)
        .to receive_message_chain(:photos, :available, :recent) { photos }
      expect(PhotoPresenter).to receive(:new) { presenter }
    end

    before { get :recent, id: username }

    it 'should respond with 200 OK' do
      expect(response.status).to be 200
    end
  end
end
