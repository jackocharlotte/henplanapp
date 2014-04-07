class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name
      t.string :cost
      t.string :notes

      t.timestamps
    end
  end
end
