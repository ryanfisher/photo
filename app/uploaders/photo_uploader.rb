class PhotoUploader
  class S3Photo < AWS::S3::S3Object
    set_current_bucket_to Rails.application.secrets.aws_image_bucket
  end

  def self.upload(uploaded_file, file_name)
    establish_connection!
    new(uploaded_file, file_name).location
  end

  def self.establish_connection!
    secrets = Rails.application.secrets
    AWS::S3::Base.establish_connection!(
      access_key_id: secrets.aws_access_key,
      secret_access_key: secrets.aws_secret_key
    )
  end

  def initialize(uploaded_file, file_name)
    @file_name = file_name
    S3Photo.store(file_name, uploaded_file)
  end

  def location
    Rails.application.secrets.aws_image_bucket.to_s + '/' + file_name
  end

  private

  attr_reader :file_name
end
