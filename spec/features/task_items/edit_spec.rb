require 'spec_helper'

describe "Editing task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }
  let!(:task_item) { task_list.task_items.create(content: "Alice") }


  it "is successful with valid content" do
    visit_task_list(task_list)
    within("#task_item_#{task_item.id}") do
      click_link "Edit"
    end  
    fill_in "Content", with: "Anna"
    click_button "Save"
    expect(page).to have_content("Saved task list item.")
    task_item.reload
    expect(task_item.content).to eq("Anna")
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