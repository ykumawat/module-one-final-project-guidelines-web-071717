class CreateTableRecipeIngredients < ActiveRecord::Migration[4.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :quantity
      t.string :type
    end
  end
end
