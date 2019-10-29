class RemoveUserFromWorkshops < ActiveRecord::Migration[5.2]
  def change
    remove_reference :workshops, :user, foreign_key: true
  end
end
