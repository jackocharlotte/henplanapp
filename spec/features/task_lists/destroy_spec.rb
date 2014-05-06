require 'spec_helper'

describe "Deleting task lists" do
  let!(:task_list) { TaskList.create(title: "Groceries", description: "Grocery list.") }

  it "is successful when clicking the destroy link" do
    visit "/task_lists"

    within "#task_list_#{task_list.id}" do
      click_link "Delete"
    end
    expect(page).to_not have_content(task_list.title)
    expect(TaskList.count).to eq(0)
  end
end