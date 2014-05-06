#Followed Treehouse tutorial - Writing our first tests http://teamtreehouse.com/library/build-a-todo-list-application-with-rails-4/build-a-todo-list-application-with-rails-4/write-our-first-tests

require 'spec_helper'

describe "Completing task items" do
  let!(:task_list) { TaskList.create(title: "Attendees", description: "Gather list") }
  let!(:task_item) { task_list.task_items.create(content: "Alice") }

  it "is successful when marking a single item complete" do
    expect(task_item.completed_at).to be_nil
    visit_task_list task_list
    within dom_id_for(task_item) do
      click_link "Mark Complete"
    end
    task_item.reload
    expect(task_item.completed_at).to_not be_nil
  end

  context "with completed items" do
    let!(:completed_task_item) { task_list.task_items.create(content: "Katie", completed_at: 5.minutes.ago) }

      it "shows completed items as complete" do
        visit_task_list task_list
        within dom_id_for(completed_task_item) do
          expect(page).to have_content(completed_task_item.completed_at)
        end
      end


  it "does not give the option to mark complete" do
    visit_task_list task_list
      within dom_id_for(completed_task_item) do
        expect(page).to_not have_content("Mark Complete")
      end
   end
  end
end