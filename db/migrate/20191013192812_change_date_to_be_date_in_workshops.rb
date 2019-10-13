class ChangeDateToBeDateInWorkshops < ActiveRecord::Migration[5.2]
  def up
    change_column :workshops, :date, :date
  end

  def down
    change_column :workshops, :date, :string
  end
end
