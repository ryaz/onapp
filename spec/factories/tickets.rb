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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    status "MyString"
    name "MyString"
    email "MyString"
    subject "MyString"
    body "MyText"
    uid "MyString"
  end
end
