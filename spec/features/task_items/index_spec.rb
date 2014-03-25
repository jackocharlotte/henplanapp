require 'spec_helper'

describe "Viewing task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }

  before do
    visit "/task_lists"
    within "#task_list_#{task_list.id}" do
      click_link "List Items"
    end
  end

  it "displays the title of the task list" do
    within("h1") do
      expect(page).to have_content(task_list.title)
    end
  end

  it "displays no items when a task list is empty" do
    expect(page.all("ul.task_items li").size).to eq(0)
  end
end