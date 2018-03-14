class CreateStudentAssessements < ActiveRecord::Migration[5.0]
  def change
    create_table :student_assessements do |t|
      t.integer :student_id
      t.date :assessement_date
      t.string :assessement_answers

      t.timestamps
    end
  end
end
