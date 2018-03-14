class CreateEducationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :education_details do |t|
      t.integer :education_id
      t.integer :category
      t.integer :course
      t.integer :status
      t.integer :score
      t.integer :created_by , null:false
      t.integer :updated_by , null:false

      t.timestamps
    end
  end
end
