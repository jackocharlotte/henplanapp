class CreateTaskItems < ActiveRecord::Migration
  def change
    create_table :task_items do |t|
      t.references :task_list, index: true
      t.string :content

      t.timestamps
    end
  end
end
