require 'spec_helper'

describe "Deleting task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }
  let!(:task_item) { task_list.task_items.create(content: "Alice") }

  def visit_task_list(list)
  visit "/task_lists"
    within "#task_list_#{list.id}" do
      click_link "List Items"
    end
  end

  it "is successful" do
  	visit_task_list(task_list)
  	within "#task_item_#{task_item.id}" do
  		click_link "Delete"
  	end
  	expect(page).to have_content("Task list item was deleted.")
  	expect(TaskItem.count).to eq(0)
  end
end