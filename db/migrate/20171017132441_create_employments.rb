class CreateEmployments < ActiveRecord::Migration[5.0]
  def change
    create_table :employments do |t|
      t.references :career_plan_outcomes, index: true
      t.string :work_site_name
      t.string :point_of_contact
      t.string :occupation
      t.integer :position_type
      t.decimal :salary_per_hour, precision: 5, scale: 2
      t.date :start_date
      t.date :end_date
      t.integer :working_hours_per_week
      t.integer :completed
      t.text :outcome
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
