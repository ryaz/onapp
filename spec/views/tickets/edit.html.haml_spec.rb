require 'spec_helper'

describe "tickets/edit" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :status => "MyString",
      :name => "MyString",
      :email => "MyString",
      :subject => "MyString",
      :body => "MyText",
      :uid => "MyString"
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do
      assert_select "input#ticket_status[name=?]", "ticket[status]"
      assert_select "input#ticket_name[name=?]", "ticket[name]"
      assert_select "input#ticket_email[name=?]", "ticket[email]"
      assert_select "input#ticket_subject[name=?]", "ticket[subject]"
      assert_select "textarea#ticket_body[name=?]", "ticket[body]"
      assert_select "input#ticket_uid[name=?]", "ticket[uid]"
    end
  end
end
