class AddUserToWorkshop < ActiveRecord::Migration[5.2]
  def change
    add_reference :workshops, :user, foreign_key: true
  end
end
