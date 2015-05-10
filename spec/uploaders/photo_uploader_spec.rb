require 'rails_helper'
require 'carrierwave/test/matchers'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  subject { described_class.new }

  before do
    described_class.enable_processing = true
  end

  describe '#extension_white_list' do
    subject { described_class.new.extension_white_list }

    it { should include('jpg')  }
    it { should include('jpeg') }
    it { should include('png')  }
    it { should include('gif')  }
  end
end
