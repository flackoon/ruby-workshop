class CreateJoinTableUsersWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :workshops do |t|
      # t.index [:user_id, :workshop_id]
      # t.index [:workshop_id, :user_id]
    end
  end
end
