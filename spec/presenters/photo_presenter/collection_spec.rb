require 'rails_helper'

describe PhotoPresenter::Collection do
  subject { described_class.new(photo_collection) }

  let(:photo_collection) { [] }

  describe '.new' do
    it 'returns the subject' do
      expect(subject).to be_an_instance_of described_class
    end
  end

  describe '#to_json' do
    it 'calls to_json on each presenter in collection' do
      expect(subject.to_json).to eq '[]'
    end
  end
end
