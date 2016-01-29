class Bucket < ActiveRecord::Base
  enum provider: [ :aws, :google, :rackspace ]
  attr_encrypted :access_key_id, key: Rails.application.secrets.access_key
  attr_encrypted :secret_access_key, key: Rails.application.secrets.secret_key

  # Aliased for use with rackspace
  alias_attribute :username, :access_key_id
  alias_attribute :api_key, :secret_access_key

  # A fog connection to the bucket
  def connection
    @_connection ||= begin
      connection_keys = Hash[keys.zip([access_key_id, secret_access_key])]
      Fog::Storage.new(connection_keys.merge(provider: provider))
    end
  end

  def upload(key, file)
    directory.files.create(key: key, body: file, public: true).public_url
  end

  def delete_file(key)
    directory.files.destroy(key)
  end

  def directory
    @_directory ||= connection.directories.new(key: name)
  end

  # The file representation of the
  #
  # @return [Fog::Storage::Google::File]
  def file(key)
    directory.files.get(key)
  end

  private

  def keys
    case provider
    when 'aws'
      [:aws_access_key_id, :aws_secret_access_key]
    when 'google'
      [:google_storage_access_key_id, :google_storage_secret_access_key]
    when 'rackspace'
      [:rackspace_username, :rackspace_api_key]
    end
  end
end
