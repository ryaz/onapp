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
