require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :status => "Status",
      :name => "Name",
      :email => "Email",
      :subject => "Subject",
      :body => "MyText",
      :uid => "Uid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
    rendered.should match(/Uid/)
  end
end
