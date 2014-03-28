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

end