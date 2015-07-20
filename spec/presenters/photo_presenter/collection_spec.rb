require 'rails_helper'

describe PhotoPresenter::Collection do
  subject { described_class.new(photo_collection) }

  let(:photo_collection) { [] }

  describe '.new' do
    it 'returns the subject' do
      expect(subject).to be_an_instance_of described_class
    end
  end
end
