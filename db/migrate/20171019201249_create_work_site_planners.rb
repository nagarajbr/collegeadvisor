class CreateWorkSitePlanners < ActiveRecord::Migration[5.0]
  def change
    create_table :work_site_planners do |t|
        t.references :career_plan_outcome
      t.integer :event_id
      t.date :activity_date
      t.string :work_site_name
      t.string :point_of_contact
      t.string :occupation
      t.integer :position_type
      t.decimal :salary_per_hour, precision: 5, scale: 2
      t.integer :working_hours_per_week
      t.integer :completed
      t.string :outcome
      t.integer :job_seeker_id
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
