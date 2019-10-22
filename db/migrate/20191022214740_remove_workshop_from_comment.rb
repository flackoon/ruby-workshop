class RemoveWorkshopFromComment < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :workshop, foreign_key: true
  end
end
