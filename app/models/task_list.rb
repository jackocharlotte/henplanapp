class TaskList < ActiveRecord::Base

	has_many :task_items
	
	validates :title, presence: true
  	validates :title, length: { minimum: 3 }

  	def has_completed_items?
    	task_items.complete.size > 0
  	end

  	def has_incomplete_items?
    	task_items.incomplete.size > 0
  	end 
end