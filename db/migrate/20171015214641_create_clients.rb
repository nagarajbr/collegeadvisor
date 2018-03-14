class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
     t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :suffix
      t.date :dob
      t.integer :gender
      t.string :email
      t.string :goals ,      array:true
      t.string :barriers ,   array:true
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
