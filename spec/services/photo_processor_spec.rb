describe PhotoProcessor do
  subject { described_class.new(photo, uploaded_file) }

  let(:user) do
    User.create(email: 'han@example.com', password: 'password')
  end
  let(:photo)         { Photo.new user_id: user.id           }
  let(:image)         { double(:image, dimensions: [20, 10]) }
  let(:uploaded_file) { double(:uploaded_file, size: 30)     }

  describe '.new' do
    it 'is an instance of described class' do
      expect(subject).to be_instance_of described_class
    end
  end

  describe '#process' do
    before do
      expect(MiniMagick::Image).to receive(:new) { image }
      expect(image).to receive(:signature) { '' }
      expect(uploaded_file).to receive(:path)
    end

    describe 'when photo does not exist' do
      before do
        expect(photo).to receive(:file_path) { '/' }
        expect(image).to receive(:exif)
        expect(uploaded_file).to receive(:original_filename)
        expect(PhotoUploader).to receive(:upload) { '/' }
        expect(PhotoResizeJob).to receive(:perform_later)
      end

      it 'responds with a boolen value' do
        expect(subject.process).to be true
      end
    end

    describe 'when photo already exists' do
      before do
        expect(Photo).to receive(:exists?) { true }
      end

      it 'responds with false' do
        expect(subject.process).to be false
      end
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
