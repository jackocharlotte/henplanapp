#Followed Treehouse tutorial - Writing our first tests http://teamtreehouse.com/library/build-a-todo-list-application-with-rails-4/build-a-todo-list-application-with-rails-4/write-our-first-tests

require 'spec_helper'

describe "Deleting task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }
  let!(:task_item) { task_list.task_items.create(content: "Alice") }


  it "is successful" do
  	visit_task_list(task_list)
  	within "#task_item_#{task_item.id}" do
  		click_link "Delete"
  	end
  	expect(page).to have_content("Task list item was deleted.")
  	expect(TaskItem.count).to eq(0)
  end
end