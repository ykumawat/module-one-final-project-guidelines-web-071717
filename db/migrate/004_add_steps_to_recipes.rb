class AddStepsToRecipes < ActiveRecord::Migration[4.2]
  def change
    add_column :recipes, :steps, :text
  end
end
