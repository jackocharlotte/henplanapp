class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.string :money
      t.string :notes

      t.timestamps
    end
  end
end
