class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore') 
    create_table :events do |t|
      t.references :resource
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color
      t.integer :job_seeker_id
      t.string :name
      t.string :contact
      t.integer :hours
      t.string :outcome
      t.string :occupation_program
      t.string :position_major
      t.hstore :month_to_complete
      t.timestamps
    end
  end
end
