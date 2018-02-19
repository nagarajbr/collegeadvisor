class CreateWorkSearchBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :work_search_blogs do |t|
      t.references :career_plan_outcome
      t.integer :event_id
      t.date :activity_date
      t.integer :hours_spent
      t.text :work_site_name
      t.text :address1
      t.text :address2
      t.text :city
      t.text :state
      t.integer :zip
      t.text :person_contacted
      t.text :contact_outcome
      t.text :comments
      t.integer :job_seeker_id
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
