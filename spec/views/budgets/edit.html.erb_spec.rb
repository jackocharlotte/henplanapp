require 'spec_helper'

describe "budgets/edit" do
  before(:each) do
    @budget = assign(:budget, stub_model(Budget,
      :name => "MyString",
      :cost => "MyString",
      :notes => "MyString"
    ))
  end

  it "renders the edit budget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", budget_path(@budget), "post" do
      assert_select "input#budget_name[name=?]", "budget[name]"
      assert_select "input#budget_cost[name=?]", "budget[cost]"
      assert_select "input#budget_notes[name=?]", "budget[notes]"
    end
  end
end
