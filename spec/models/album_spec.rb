require 'rails_helper'

describe Album, type: :model do
  describe '#update_with' do
    let(:sorted_photos) { double(:sorted_photos) }
    let(:sorted_photo)  { double(:sorted_photo)  }
    let(:hash) do
      { title: 'Switzerland!', photos: [{ photo_id: 1, position: 3 }] }
    end

    before do
      expect(subject).to receive(:sorted_photos) { sorted_photos }
      expect(sorted_photos).to receive(:create_with)
        .with(position: 0) { sorted_photos }
      expect(sorted_photos).to receive(:find_or_create_by)
        .with(photo_id: 1) { sorted_photo }
      expect(subject).to receive(:title=).with('Switzerland!')
      expect(subject).to receive(:save) { true }
    end

    it 'should update the sorted photos and return the album' do
      expect(subject.update_with(hash)).to be subject
    end
  end

  describe '#create' do
    subject { Album.create(title: 'Costa Rica', user_id: user.id) }

    let(:user) do
      User.create(
        email: 'hansolo@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    it 'should create a stub from the title when creating an album' do
      expect(subject.stub).to eq 'costa-rica'
    end

    it 'should set the title' do
      expect(subject.title).to eq 'Costa Rica'
    end
  end
end
