require 'spec_helper'

describe Response do
  it { should belong_to(:ticket) }
  it { should validate_presence_of(:text) }
end
