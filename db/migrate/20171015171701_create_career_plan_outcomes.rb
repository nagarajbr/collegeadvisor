class CreateCareerPlanOutcomes < ActiveRecord::Migration[5.0]
  def change
    create_table :career_plan_outcomes do |t|
      t.integer :event_id
      t.integer :job_seeker_id
      t.integer :activity
      t.date :start_date
      t.integer :planned_hours
      t.integer :completed
      t.string  :reason
      t.text :outcome
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
