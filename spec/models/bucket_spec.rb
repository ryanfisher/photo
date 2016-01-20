require 'rails_helper'

describe Bucket, type: :model do
  it { is_expected.to respond_to :name }
end
