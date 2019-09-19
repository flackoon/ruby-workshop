class AddDateAndTitleToWorkshop < ActiveRecord::Migration[5.2]
  def change
    add_column :workshops, :date, :string
    add_column :workshops, :title, :string
  end
end
