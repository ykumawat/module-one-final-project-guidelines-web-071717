require_relative "recipesdata.rb"
recipes = RecipesData::RECIPES

module RecipesAPI
  class Adapter

  def create_recipe_ingredients_db
    recipes.each do |specific_recipe|
      recipe = Recipe.create(name: specific_recipe[:title], steps: specific_recipe[:directions].join(", "))
      recipe.ingredients.create(name: specific_recipe[:ingredients])
    end
  end

    # sole responsibility is to get recipe data from API and put it in format we want.

    def input_info(input_ingredients)
      # Takes input information
          # ingredients
      ## take in user input about ingredients
      ## Call on ingredient class and check that ingredients exist
      ## Find by / select specified ingredients
      split_ingredients = input_ingredients.split(", ")
      split_ingredients.each do |specific_ingredient|
        Recipe.all.ingredient.find_by(specific_ingredient)
      end
    end


    def recipe_preference(input_preferences)
      ## ingredients, preference, cuisince
      # Filters recipes to meet preferences + cuisine matches
          # preference/cuisine => include only recipes w that tag/description
      # Filters ingredients for those that match exclude allergies
          # shellfish => exclude shellfish tags
          # peanuts => include only 'peanut free'
          # gluten => include only 'gluten free'
    end


    def filter_recipes

    end


    def output_recipes
      # Outputs a recipe title; if user likes it they can get the directions
          # IF WE HAVE TIME! If user rejects it, selects next recipe
      filter_recipes
    end


  end
end

# To call:
# RecipesAPI::Adapter

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

all_ingredients = []
recipes.each do |recipe|
  recipe[:ingredients].each {|ingredient| all_ingredients << ingredient[:name]}
end

all_ingredients.uniq!

all_ingredients.each do |ing|
  Ingredient.create(name: ing)
  ## FIND OR CREATE BY?!
end


