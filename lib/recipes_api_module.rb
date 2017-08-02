require 'json'

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
      puts "#{idx + 1}. #{rec[:title]}\n\nDirections: #{rec[:directions]}\n\n"
      rec_ings = rec.ingredients.map{|ingredient| ingredient.name}
      puts "#{rec_ings}"
      puts ""
    end
    puts "That's all! \nEnjoy your meal!"
  end

def self.food_ingredient_pref(food_input, ingredient_input) ## DONT FORGET SELF.
    preference_recipes = []
      Recipe.all.each do |this_recipe|
       if this_recipe.category.include?("#{food_input}")
        preference_recipes << this_recipe
      end
    end
    ingredient_preference_recipes = [] ### RETURN THIS ARRAY TO BE USED FOR SAMPLE
    preference_recipes.each do |this_recipe|
    i = this_recipe.ingredients.where("name LIKE ?", "%#{ingredient_input}%")
        i.each do |ingredient|
          ingredient.recipes.each do |matched_recipe|
            ingredient_preference_recipes << matched_recipe
          end
        end
      end
    ingredient_preference_recipes
    end
  end
end
