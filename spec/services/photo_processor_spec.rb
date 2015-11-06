describe PhotoProcessor do
  subject { described_class.new(photo, uploaded_file) }

  let(:photo)         { double(:photo, file_path: '/')       }
  let(:image)         { double(:image, dimensions: [20, 10]) }
  let(:versions)      { double(:versions)                    }
  let(:uploaded_file) { double(:uploaded_file, size: 30)     }

  before do
    # TODO: Refactor and remove some of the mocking
    expect(photo).to receive(:size=)
    expect(photo).to receive(:save) { true }
    expect(photo).to receive(:versions) { versions }
    expect(photo).to receive(:original_filename=)
    expect(uploaded_file).to receive(:original_filename)
    expect(uploaded_file).to receive(:path)
    expect(versions).to receive(:new)
    expect(PhotoUploader).to receive(:upload)
    expect(MiniMagick::Image).to receive(:new) { image }
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

  describe '#uploaded_file' do
    it { should_not respond_to(:uploaded_file) }
  end
end
