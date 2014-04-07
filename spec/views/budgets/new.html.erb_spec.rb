require 'spec_helper'

describe "budgets/new" do
  before(:each) do
    assign(:budget, stub_model(Budget,
      :name => "MyString",
      :cost => "MyString",
      :notes => "MyString"
    ).as_new_record)
  end

  it "renders new budget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", budgets_path, "post" do
      assert_select "input#budget_name[name=?]", "budget[name]"
      assert_select "input#budget_cost[name=?]", "budget[cost]"
      assert_select "input#budget_notes[name=?]", "budget[notes]"
    end
  end
end
