require 'spec_helper'

describe "budgets/show" do
  before(:each) do
    @budget = assign(:budget, stub_model(Budget,
      :name => "Name",
      :cost => "Cost",
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Cost/)
    rendered.should match(/Notes/)
  end
end
