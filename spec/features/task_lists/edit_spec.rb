require 'spec_helper'

describe "Editing task lists" do
  let!(:task_list) { TaskList.create(title: "Activities", description: "Activity checklist.") }

  def update_task_list(options={})
    options[:title] ||= "My task list"
    options[:description] ||= "This is my task list."
    task_list = options[:task_list]

    visit "/task_lists"
    within "#task_list_#{task_list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Task list"
  end

  it "updates a task list successfully with correct information" do
    update_task_list task_list: task_list, 
                     title: "New title", 
                     description: "New description"

    task_list.reload

    expect(page).to have_content("Task list was successfully updated")
    expect(task_list.title).to eq("New title")
    expect(task_list.description).to eq("New description")
  end

  it "displays an error with no title" do
    update_task_list task_list: task_list, title: ""
    title = task_list.title
    task_list.reload
    expect(task_list.title).to eq(title)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a title" do
    update_task_list task_list: task_list, title: "hi"
    expect(page).to have_content("error")
  end
end