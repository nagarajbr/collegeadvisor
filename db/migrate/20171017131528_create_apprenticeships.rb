class CreateApprenticeships < ActiveRecord::Migration[5.0]
  def change
    create_table :apprenticeships do |t|

      t.timestamps
    end
  end
end
