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
      puts "#{idx + 1}. #{rec[:title]}\n\nDirections: #{rec[:directions]}\n\nRecipe Tags: #{rec[:category]}\n\n"
    end
  end


def self.food_ingredient_pref(food_input, ingredient_input) ## DONT FORGET SELF.
  preference_recipes = []
      Recipe.all.each do |this_recipe|
       if this_recipe.category.include?("#{food_input}")
        preference_recipes << this_recipe
      end
    end

  ingredient_preference_recipes = []

      preference_recipes.each do |this_recipe|
      i = this_recipe.ingredients.where("name LIKE ?", "%#{ingredient_input}%")
          i.each do |ingredient|
            ingredient.recipes.each do |matched_recipe|
              ingredient_preference_recipes << matched_recipe
            end
          end
        end
  puts ingredient_preference_recipes.first.title
  puts "\n"
  ingredient_preference_recipes.first.ingredients.map {|ingredient| puts ingredient.name}
  puts "\n"
  puts ingredient_preference_recipes.first.directions
end

# def food_pref(input)
#   preference_recipes = []
#       Recipe.all.each do |this_recipe|
#        if this_recipe.category.include?("#{input}")
#         preference_recipes << this_recipe
#       end
#     end
#   preference_recipes
#   ingredient_pref(preference_recipes)
# end


# def ingredient_pref(input)
#   ingredient_preference_recipes = []
#   ingredient_picked = gets.chomp
#       Recipe.all.each do |this_recipe|
#       i = this_recipe.ingredients.where("name LIKE ?", "%#{ingredient_picked}%")
#           i.each do |ingredient|
#             ingredient.recipes.each do |matched_recipe|
#               ingredient_preference_recipes << matched_recipe.title
#             end
#           end
#         end
#   ingredient_preference_recipes
# end





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
      # IF recipe contains preference in category, collect
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



    # def recipe_preference(input_preferences)
      ## ingredients, preference, cuisine
      # Filters recipes to meet preferences + cuisine matches
          # preference/cuisine => include only recipes w that tag/description
      # Filters ingredients for those that match exclude allergies
          # shellfish => exclude shellfish tags
          # peanuts => include only 'peanut free'
          # gluten => include only 'gluten free'
    # end


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
