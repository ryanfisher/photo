describe PhotoProcessor do
  subject { described_class.new(photo, file_stream) }

  let(:photo)       { double(:photo)       }
  let(:file_stream) { double(:file_stream) }

  describe '.new' do
    it 'is an instance of described class' do
      expect(subject).to be_instance_of described_class
    end
  end
end
