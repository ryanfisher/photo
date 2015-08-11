describe PhotoProcessor do
  subject { described_class.new(photo, file_stream) }

  let(:photo)       { double(:photo)    }
  let(:versions)    { double(:versions) }
  let(:file_stream) do
    double(:file_stream, original_filename: 'obi.jpg', size: 30)
  end

  before do
    expect(photo).to receive(:size=)
    expect(photo).to receive(:username)
    expect(photo).to receive(:save) { true }
    expect(photo).to receive(:versions) { versions }
    expect(versions).to receive(:new)
    expect(PhotoUploader).to receive(:upload)
  end

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
