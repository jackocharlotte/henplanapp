#Followed Treehouse tutorial - Writing our first tests http://teamtreehouse.com/library/build-a-todo-list-application-with-rails-4/build-a-todo-list-application-with-rails-4/write-our-first-tests

require 'spec_helper'

describe "Creating task lists" do
  def create_task_list(options={})
    options[:title] ||= "My task list"
    options[:description] ||= "This is my task list."

    visit "/task_lists"
    click_link "New Task list"
    expect(page).to have_content("New task_list")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Task list"
  end

  it "redirects to the task list index page on success" do
    create_task_list
    expect(page).to have_content("My task list")
  end

  it "displays an error when the task list has no title" do
    expect(TaskList.count).to eq(0)

    create_task_list title: ""

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the task list has a title less than 3 characters" do
    expect(TaskList.count).to eq(0)

    create_task_list title: "Hi"

    expect(page).to have_content("error")
    expect(TaskList.count).to eq(0)

    visit "/task_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

end