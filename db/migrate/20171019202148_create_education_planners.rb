class CreateEducationPlanners < ActiveRecord::Migration[5.0]
  def change
    create_table :education_planners do |t|
     t.references :career_plan_outcome
      t.integer :event_id
      t.date :activity_date
      t.string :school_name
      t.string :point_of_contact
      t.string :program
      t.string :major
      t.integer :class_hours_per_week
      t.integer :completed
      t.text :outcome
      t.integer :job_seeker_id
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
