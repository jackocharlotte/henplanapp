require 'spec_helper'

describe "attendees/new" do
  before(:each) do
    assign(:attendee, stub_model(Attendee,
      :name => "MyString",
      :email => "MyString",
      :money => "MyString",
      :notes => "MyString"
    ).as_new_record)
  end

  it "renders new attendee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attendees_path, "post" do
      assert_select "input#attendee_name[name=?]", "attendee[name]"
      assert_select "input#attendee_email[name=?]", "attendee[email]"
      assert_select "input#attendee_money[name=?]", "attendee[money]"
      assert_select "input#attendee_notes[name=?]", "attendee[notes]"
    end
  end
end
