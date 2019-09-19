class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|

      t.timestamps
    end
  end
end
