class TaskList < ActiveRecord::Base

	has_many :task_items
	
	validates :title, presence: true


end
