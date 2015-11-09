describe PhotoProcessor do
  subject { described_class.new(photo, uploaded_file) }

  let(:user) do
    User.create(email: 'han@example.com', password: 'password')
  end
  let(:photo)         { Photo.new user_id: user.id           }
  let(:image)         { double(:image, dimensions: [20, 10]) }
  let(:uploaded_file) { double(:uploaded_file, size: 30)     }

  before do
    expect(photo).to receive(:file_path) { '/' }
    expect(image).to receive(:exif)
    expect(uploaded_file).to receive(:original_filename)
    expect(uploaded_file).to receive(:path)
    expect(PhotoUploader).to receive(:upload) { '/' }
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
