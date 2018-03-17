class DomainCode < ActiveRecord::Migration[5.0]
  def change
  	create_table :master_domains do |t|
      t.string  :description
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
    add_index :master_domains, :description, unique: true

    create_table :master_domain_items do |t|
      t.integer :master_domain_id
      t.string  :value
      t.string  :short_description
      t.string  :long_description
      t.boolean :status
      t.string  :usage
      t.integer :created_by , null:false
      t.integer :updated_by , null:false
      t.timestamps
    end
  end
end
