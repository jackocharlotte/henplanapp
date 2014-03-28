module TaskListHelpers
  def visit_task_list(list)
    visit "/task_lists"
    within dom_id_for(list) do
      click_link "List Items"
    end
  end
end