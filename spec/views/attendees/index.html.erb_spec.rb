require 'spec_helper'

describe "attendees/index" do
  before(:each) do
    assign(:attendees, [
      stub_model(Attendee,
        :name => "Name",
        :email => "Email",
        :money => "Money",
        :notes => "Notes"
      ),
      stub_model(Attendee,
        :name => "Name",
        :email => "Email",
        :money => "Money",
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of attendees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Money".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
