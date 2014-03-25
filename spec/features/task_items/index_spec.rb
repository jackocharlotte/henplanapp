require 'spec_helper'

describe "Viewing task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }

def visit_task_list(list)
  visit "/task_lists"
    within "#task_list_#{list.id}" do
      click_link "List Items"
    end
  end

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

  
end