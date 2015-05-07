require 'rails_helper'

describe Photo, type: :model do
  it { should respond_to :file }
end
