class AddDescriptionAndCategoryToWorkshop < ActiveRecord::Migration[5.2]
  def change
    add_column :workshops, :description, :text
    add_reference :workshops, :category, foreign_key: true
  end
end
