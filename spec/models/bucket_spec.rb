require 'rails_helper'

describe Bucket, type: :model do
  it { is_expected.to respond_to :name }

  describe '#connection' do
    let(:connection) { double(:connection) }

    before do
      subject.provider = provider
      subject.access_key_id = 'access key'
      subject.secret_access_key = 'secret key'
      expect(Fog::Storage).to receive(:new)
        .with(a_hash_including(config_hash)) { connection }
    end

    describe 'when provider is google' do
      let(:provider) { :google }
      let(:config_hash) do
        {
          provider: 'google',
          google_storage_access_key_id: 'access key',
          google_storage_secret_access_key: 'secret key'
        }
      end

      it 'should initialize Fog::Storage with correct hash' do
        expect(subject.connection).to be connection
      end
    end

    describe 'when provider is aws' do
      let(:provider) { :aws }
      let(:config_hash) do
        {
          provider: 'aws',
          aws_access_key_id: 'access key',
          aws_secret_access_key: 'secret key'
        }
      end

      it 'should initialize Fog::Storage with correct hash' do
        expect(subject.connection).to be connection
      end
    end

    describe 'when provider is google' do
      let(:provider) { :rackspace }
      let(:config_hash) do
        {
          provider: 'rackspace',
          rackspace_username: 'access key',
          rackspace_api_key: 'secret key'
        }
      end

      it 'should initialize Fog::Storage with correct hash' do
        expect(subject.connection).to be connection
      end
    end
  end
end
