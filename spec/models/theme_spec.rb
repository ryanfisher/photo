require 'rails_helper'

describe Theme, type: :model do
  it { is_expected.to respond_to :name }
end
