require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :status => "MyString",
      :name => "MyString",
      :email => "MyString",
      :subject => "MyString",
      :body => "MyText",
      :uid => "MyString"
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tickets_path, "post" do
      assert_select "input#ticket_status[name=?]", "ticket[status]"
      assert_select "input#ticket_name[name=?]", "ticket[name]"
      assert_select "input#ticket_email[name=?]", "ticket[email]"
      assert_select "input#ticket_subject[name=?]", "ticket[subject]"
      assert_select "textarea#ticket_body[name=?]", "ticket[body]"
      assert_select "input#ticket_uid[name=?]", "ticket[uid]"
    end
  end
end
