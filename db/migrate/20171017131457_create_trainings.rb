class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|

      t.timestamps
    end
  end
end
