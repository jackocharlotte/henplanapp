require 'spec_helper'

describe "Viewing task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }

def visit_task_list(list)
  visit "/task_lists"
    within "#task_list_#{list.id}" do
      click_link "List Items"
   	end
end

it "is successful with valid content" do
  	visit_task_list(task_list)
  	click_link "New Task Item"
  	fill_in "Content", with: "Emma"
  	click_button "Save"
  	expect(page).to have_content("Added task list item.")
  	within(".task_items") do
	expect(page).to have_content("Emma")
  	end 
  end

end