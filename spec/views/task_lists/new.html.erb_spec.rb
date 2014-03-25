require 'spec_helper'

describe "task_lists/new" do
  before(:each) do
    assign(:task_list, stub_model(TaskList,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new task_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_lists_path, "post" do
      assert_select "input#task_list_title[name=?]", "task_list[title]"
      assert_select "textarea#task_list_description[name=?]", "task_list[description]"
    end
  end
end
