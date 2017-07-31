Recipe.delete_all
Ingredient.delete_all
RecipeIngredient.delete_all
require_relative '../lib/recipesdata.rb'
require_relative '../lib/recipe.rb'
require 'pry'
recipes = RecipesData::RECIPES

recipes.each do |recipe|
  this_recipe_ingredients = []
  recipe[:ingredients].each do |ingredient|
    this_recipe_ingredients << ingredient[:name]
  end
  recipe = Recipe.create(name: recipe[:name], steps: recipe[:steps].join(" "), url: recipe[:originalURL])
  this_recipe_ingredients.each do |ing_name|
    recipe.ingredients.create(name: ing_name)
  end
end

# def get_ings
#   recipes.each do |recipe|
#     recipe[:ingredients].collect do |ing|
#      ing[:name]
#     end
#   end
# end

all_ingredients = []
recipes.each do |recipe|
  recipe[:ingredients].each {|ingredient| all_ingredients << ingredient[:name]}
end

all_ingredients.uniq!

all_ingredients.each do |ing|
  Ingredient.create(name: ing)
end


# uniq_recipe_array = []
# recipes.each do |recipe|
#
#     Recipe.all.each do |rec_name|
#       recipe[:ingredients].each do |ing|
#       if recipe[:name] == rec_name.name
#         uniq_recipe_array << ing[:name]
#         rec_name.ing_array = uniq_recipe_array.join(", ")
#       end
#       Recipe.where("name = ?", rec_name.name).update(ing_array: uniq_recipe_array)
#
#     end
#   end
# end
