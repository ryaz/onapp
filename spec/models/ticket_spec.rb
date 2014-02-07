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
  pending "add some examples to (or delete) #{__FILE__}"
end
