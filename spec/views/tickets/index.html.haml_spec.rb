require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :status => "Status",
        :name => "Name",
        :email => "Email",
        :subject => "Subject",
        :body => "MyText",
        :uid => "Uid"
      ),
      stub_model(Ticket,
        :status => "Status",
        :name => "Name",
        :email => "Email",
        :subject => "Subject",
        :body => "MyText",
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end
