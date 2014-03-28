module TaskListHelpers
	def visit_task_list(list)
	  visit "/task_lists"
	    within "#task_list_#{list.id}" do
	      click_link "List Items"
	   	end
	end
end