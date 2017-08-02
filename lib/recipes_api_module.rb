#require_relative "recipesdata.rb"
#recipes = RecipesData::RECIPES
require 'json'

#require_relative 'recipesdata.rb'

module RecipesAPI
  class Adapter


  def self.read_json
    file = File.read('lib/full_format_recipes.json')
    recipes = JSON.parse(file)

    recipes.each do |r|
      directions = r["directions"].join(", ")
      recipe = Recipe.create(title: r["title"], directions: directions, category: r["categories"])
      r["ingredients"].each do |i|
        recipe.ingredients.create(name: i)
      end

    end
  end

  def self.random_recipe
    random_recipes = Recipe.where(id: Recipe.pluck(:id).sample(5))
    random_recipes.each_with_index do |rec, idx|
      puts "#{idx + 1}. #{rec[:title]}"
      puts ""
      puts rec[:directions]
      puts rec[:category]
      puts ""
      puts ""
    end
  end


    def self.input_info(input_ingredients)
      # Takes input information
          # ingredients
      ## take in user input about ingredients
      ## Call on ingredient class and check that ingredients exist
      ## Find by / select specified ingredients
      split_ingredients = input_ingredients.split(", ")
      # relevant_recipes =
        matches = []
      split_ingredients.each do |specific_ingredient|
        # we want find the recipes that contain EACH specific ingredient
        Recipe.all.each do |this_recipe|
          i = this_recipe.ingredients.where("name LIKE ?", "%#{specific_ingredient}%")
            i.each do |ingredient|
              ingredient.recipes.each do |matched_recipe|
                matches << matched_recipe.title
              end
          end
        end
        puts matches
      end
    end


#     def recipe_preference(input_preferences)
#       ## ingredients, preference, cuisince
#       # Filters recipes to meet preferences + cuisine matches
#           # preference/cuisine => include only recipes w that tag/description
#       # Filters ingredients for those that match exclude allergies
#           # shellfish => exclude shellfish tags
#           # peanuts => include only 'peanut free'
#           # gluten => include only 'gluten free'
#     end


#     def filter_recipes

#     end


#     def output_recipes
#       # Outputs a recipe title; if user likes it they can get the directions
#           # IF WE HAVE TIME! If user rejects it, selects next recipe
#       filter_recipes
#     end


#   end
# end

# # To call:
# # RecipesAPI::Adapter

# recipes = RecipesData::RECIPES

# recipes.each do |recipe|
#   this_recipe_ingredients = []
#   recipe[:ingredients].each do |ingredient|
#     this_recipe_ingredients << ingredient[:name]
#   end
#   recipe = Recipe.create(name: recipe[:name], steps: recipe[:steps].join(" "), url: recipe[:originalURL])
#   this_recipe_ingredients.each do |ing_name|
#     recipe.ingredients.create(name: ing_name)
#   end
# end

# all_ingredients = []
# recipes.each do |recipe|
#   recipe[:ingredients].each {|ingredient| all_ingredients << ingredient[:name]}
# end

# all_ingredients.uniq!

# all_ingredients.each do |ing|
#   Ingredient.create(name: ing)
#   ## FIND OR CREATE BY?!

  end
end
