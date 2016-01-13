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
      expect(sorted_photos).to receive(:find_or_create_by)
        .with(photo_id: 1, position: 0) { sorted_photo }
      expect(subject).to receive(:title=).with('Switzerland!')
      expect(subject).to receive(:save) { true }
    end

    it 'should update the sorted photos and return the album' do
      expect(subject.update_with(hash)).to be subject
    end
  end
end