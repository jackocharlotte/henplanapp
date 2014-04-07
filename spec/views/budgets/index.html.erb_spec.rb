require 'spec_helper'

describe "budgets/index" do
  before(:each) do
    assign(:budgets, [
      stub_model(Budget,
        :name => "Name",
        :cost => "Cost",
        :notes => "Notes"
      ),
      stub_model(Budget,
        :name => "Name",
        :cost => "Cost",
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of budgets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cost".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
