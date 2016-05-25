require 'rails_helper'

describe Photo, type: :model do
  subject do
    described_class.new(file_key: '12345', original_filename: 'hansolohate.jpg')
  end

  let(:user) { instance_double('User', username: 'kyloren') }

  before { allow(subject).to receive(:user) { user } }

  describe '#file_path' do
    it 'returns a file path' do
      expect(subject.file_path).to eq 'photos/kyloren/12345/hansolohate.jpg'
    end
  end

  describe '#thumb_file_path' do
    it 'returns a file path' do
      expect(subject.thumb_file_path)
        .to eq 'photos/kyloren/12345/thumb_hansolohate.jpg'
    end
  end

  describe '#optimized_file_path' do
    it 'returns a file path' do
      expect(subject.optimized_file_path)
        .to eq 'photos/kyloren/12345/optimized_hansolohate.jpg'
    end
  end
end
