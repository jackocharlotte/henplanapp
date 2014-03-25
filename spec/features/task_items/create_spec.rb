require 'spec_helper'

describe "Adding task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }

  it "is successful with valid content" do
    visit_task_list(task_list)
    click_link "New Task Item"
    fill_in "Content", with: "Emma"
    click_button "Save"
    expect(page).to have_content("Added task list item.")
    within("ul.task_items") do
      expect(page).to have_content("Emma")
    end 
  end

  it "displays an error with no content" do
    visit_task_list(task_list)
    click_link "New Task Item"
    fill_in "Content", with: ""
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was a problem adding that task list item.")
    end
    expect(page).to have_content("Content can't be blank")
  end

  it "displays an error with content less than 2 characters long" do
    visit_task_list(task_list)
    click_link "New Task Item"
    fill_in "Content", with: "1"
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was a problem adding that task list item.")
    end
    expect(page).to have_content("Content is too short")
  end

end