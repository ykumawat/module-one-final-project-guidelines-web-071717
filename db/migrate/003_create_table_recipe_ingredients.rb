class CreateTableRecipeIngredients < ActiveRecord::Migration[4.2]
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
      t.string :quantity
    end
  end
end
