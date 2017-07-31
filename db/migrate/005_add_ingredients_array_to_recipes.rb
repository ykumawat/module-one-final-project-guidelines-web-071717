class AddIngredientsArrayToRecipes < ActiveRecord::Migration[4.2]
  def change
    add_column :recipes, :ing_array, :text
  end
end
