# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  status     :string(255)
#  name       :string(255)
#  email      :string(255)
#  subject    :string(255)
#  body       :text
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Ticket do
  it { should belong_to(:user) }
  it { should have_many(:responses).dependent(:destroy) }
  it { should accept_nested_attributes_for :responses }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:subject)}
  it { should validate_presence_of(:body) }
end
