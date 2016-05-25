require 'rails_helper'

describe PublicTag, type: :model do
  it { is_expected.to respond_to(:photo) }
  it { is_expected.to respond_to(:tag)   }
end
