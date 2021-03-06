require 'rails_helper'

describe AlbumPresenter do
  subject { described_class.new(resource) }

  let(:resource) { double(:resource, id: 17, title: 'Switzerland!') }

  describe '#to_json' do
    let(:presenter) { instance_double(PhotoPresenter::Collection, to_json: photos )}
    let(:photo) { double(:photo, simple_json: { id: 1, thumb_url: '/photo' }) }
    let(:photos) { [photo, photo] }

    before do
      expect(PhotoPresenter::Collection).to receive(:new) { presenter }
      expect(resource).to receive(:photos) { photos }
    end

    it 'returns a json representation of photos' do
      expect(subject.to_json).to be { [{ photo: 'photo' }, { photo: 'photo' }] }
    end
  end
end
