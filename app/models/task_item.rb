class TaskItem < ActiveRecord::Base
  belongs_to :task_list

  validates :content, presence: true

  #Completing tasks functionality from Treehouse tutorial - http://teamtreehouse.com/library/build-a-todo-list-application-with-rails-4/build-a-todo-list-application-with-rails-4/marking-todo-items-complete
  scope :complete, -> { where("completed_at is not null") }
  scope :incomplete, -> { where(completed_at: nil) }
  					  
  def completed?
  	!completed_at.blank?
  end
end

