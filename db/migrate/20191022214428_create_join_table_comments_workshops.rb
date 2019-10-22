class CreateJoinTableCommentsWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_join_table :workshops, :comments do |t|
      # t.index [:workshop_id, :comment_id]
      # t.index [:comment_id, :workshop_id]
    end
  end
end
