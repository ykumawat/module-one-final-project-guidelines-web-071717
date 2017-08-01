class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  def self.list_all_ingredients #ingredients are repeating
    Ingredient.all.map { |ing| ing.name }
  end

end
