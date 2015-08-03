require 'rails_helper'

describe PhotoUploader do
  describe '.upload' do
    let(:file_stream) { double }

    it 'should return the location of the upload' do
      expect(described_class.upload(file_stream)).to eq '/'
    end
  end
end
