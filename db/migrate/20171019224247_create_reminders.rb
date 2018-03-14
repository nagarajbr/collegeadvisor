class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.integer :jobseeker_id
      t.string :description
      t.integer :status
      t.integer :type

      t.timestamps
    end
  end
end
