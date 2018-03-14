class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.references :client, index: true
      t.string :school_name
      t.integer :attendance_type
      t.date :effective_beg_date
      t.date :effective_end_date
      t.string :major_study
      t.integer :high_grade_level
      t.date :expected_grad_date
      t.date :degree_obtained
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
