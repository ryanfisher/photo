class Bucket < ActiveRecord::Base
  enum provider: [ :aws, :google, :rackspace ]
  attr_encrypted :access_key_id, key: Rails.application.secrets.access_key
  attr_encrypted :secret_access_key, key: Rails.application.secrets.secret_key
end
