require 'rails_helper'

describe PhotoUploader do
  before do
    expect(AWS::S3::Base).to receive(:establish_connection!)
    expect(described_class::S3Photo).to receive(:store)
  end

  describe '.upload' do
    let(:file_stream) { double }

    it 'should return the location of the upload' do
      expect(described_class.upload(file_stream, ''))
        .to match '//s3.amazonaws.com'
    end
  end
end
