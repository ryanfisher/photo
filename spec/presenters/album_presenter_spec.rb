require 'rails_helper'

describe AlbumPresenter do
  subject { described_class.new(resource) }

  let(:resource) { double(:resource) }

  describe '#to_json' do
    let(:photo) { double(:photo) }
    let(:photos) { [photo, photo] }
    let(:presenter) { double(:presenter) }

    before do
      expect(resource).to receive(:photos) { photos }
      expect(PhotoPresenter).to receive(:new).exactly(2).times { presenter }
      expect(presenter).to receive(:to_json).exactly(2)
        .times { { photo: 'photo' } }
    end

    it 'returns a json representation of photos' do
      expect(subject.to_json).to be { [{ photo: 'photo' }, { photo: 'photo' }] }
    end
  end
end
