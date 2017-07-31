require_relative '../lib/recipesdata.rb'
require_relative '../lib/recipe.rb'
recipes = RecipesData::RECIPES

recipes.each do |recipe|
    Recipe.create(name: recipe[:name], steps: recipe[:steps].join(" "), url: recipe[:originalURL])
end

recipes.each do |recipe|
  recipe[:ingredients].each do |ingredient|
    Ingredient.create(name: ingredient[:name])
  end
end
