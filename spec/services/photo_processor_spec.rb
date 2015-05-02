describe PhotoProcessor do
  subject { described_class.new(photo, file_stream) }

  let(:photo)       { double(:photo)       }
  let(:file_stream) { double(:file_stream) }

  describe '.new' do
    it 'is an instance of described class' do
      expect(subject).to be_instance_of described_class
    end
  end

  describe '#photo' do
    it { should respond_to(:photo) }

    it 'is the instance of photo' do
      expect(subject.photo).to be photo
    end
  end

  describe '#file_stream' do
    it { should_not respond_to(:file_stream) }
  end
end
