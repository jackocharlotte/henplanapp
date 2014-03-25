require 'spec_helper'

describe "Viewing task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }

  it "displays the title of the task list" do
  	visit_task_list(task_list)
  	within("h1") do
  		expect(page).to have_content(task_list.title)
  	end
  end

  it "displays no items when a task list is empty" do
  	visit_task_list(task_list)
	expect(page.all("ul.task_items li").size).to eq(0)
  end

  it "displays item content when a task list has items" do
  	task_list.task_items.create(content: "Send emails")
  	task_list.task_items.create(content: "Set up attendee list")
  	
  	visit_task_list(task_list)

  	expect(page.all("ul.task_items li").size).to eq(2)
  	
  	within "ul.task_items" do
	  	expect(page).to have_content("Send emails")
	  	expect(page).to have_content("Set up attendee list")
	end
  end
end