class RemoveUserFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :user, foreign_key: true
  end
end
