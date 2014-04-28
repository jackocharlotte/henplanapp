class TaskItem < ActiveRecord::Base
  belongs_to :task_list

  validates :content, presence: true

  scope :complete, -> { where("completed_at is not null") }
  scope :incomplete, -> { where(completed_at: nil) }
  					  
  def completed?
  	!completed_at.blank?
  end
end

