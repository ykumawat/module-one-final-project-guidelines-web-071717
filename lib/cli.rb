class CommandLineInterface

  ####### UNIQ CATEGORIES SUGGESTIONS?! Categories.uniq.rand(10) or something?


  def greet
    puts "What's Cookin'?"
    puts ""
    puts "Welcome to the fastest solution for your cooking needs!"
    puts "Simply enter what ingredients you have in your kitchen."
    puts ""
  end



  def food_ingredient_selections #with examples
    puts "Do you have any food preferences that we can help accomodate?"
    puts "Please select one of the following: "
    puts "\n 1. Vegetarian \n 2. Vegan \n 3. Peanut Free \n 4. Gluten-Free \n 5. Random"
    selection = gets.chomp
    case selection
    when "1"
      selection = "Vegetarian"
      puts "How nice! You selected Vegetarian \n"
    when "2"
      selection = "Vegan"
      puts "You selected Vegan, yummy! \n"
    when "3"
      selection = "Peanut Free"
      puts "You selected Peanut Free, don't worry--we won't kill you. \n"
    when "4"
      selection = "Gluten-Free"
      puts "Gluten-Free, yum! \n"
    # when "5"
    #   selection = "Random"
    #   puts "Here's your randomly selected recipe. Enjoy!"
    #   RecipesAPI::Adapter.random_recipe
    end

  puts "Would you like to include any ONE specific ingredient? Please type below:"
  puts "Examples: ginger, asparagus, lentil, chicken, etc."
  selection2 = gets.chomp

  RecipesAPI::Adapter.food_ingredient_pref(selection, selection2)
end
end


  # def ingredient_pref
  #   # Asks user for cuisine preferences
  #   # Stores cuisine preferences somewhere
  #   # Selects cuisine types from recipes that match those listed
  #   puts "What are you in the mood for? Choose one type of cuisine:"
  #   puts "\n 1. Indian \n 2. Italian \n 3. Chinese \n 4. American \n 5. Random"
  #   selection = gets.chomp
  #   case selection
  #   when "1"
  #     selection = "Indian"
  #     puts "How nice! You selected Indian, here's your recipe:"
  #     RecipesAPI::Adapter.cuisine_pref("Indian")
  #   when "2"
  #     selection = "Italian"
  #     puts "How nice! You selected Italian, here's your recipe:"
  #     RecipesAPI::Adapter.cuisine_pref("Italian")
  #   when "3"
  #     selection = "Chinese"
  #     puts "How nice! You selected Chinese, here's your recipe:"
  #     RecipesAPI::Adapter.cuisine_pref("Chinese")
  #   when "4"
  #     selection = "American"
  #     puts "How nice! You selected American, here's your recipe:"
  #     RecipesAPI::Adapter.cuisine_pref("American")
  #   when "5"
  #     selection = "Random"
  #     puts "Here's your randomly selected recipe. Enjoy!"
  #     RecipesAPI::Adapter.random_recipe
  #   end
  # end




  # def enter_ingredients #minimum of three ingredients UNLESS user types "random"
  #   puts "Please enter a minimum of three ingredients, separated by a comma. If you would like to get a random recipe, type 'Random'."
  #   puts ""
  #   input = gets.chomp.downcase
  #   while input
  #     if input != "random" && input.split(", ").length < 3
  #       puts "Please enter at least three ingredients."
  #       input = gets.chomp.downcase
  #     elsif input == "random"
  #       puts "You selected random!"
  #       puts "Here is your randomized recipe: "
  #       #method for random recipe
  #       RecipesAPI::Adapter.random_recipe
  #       break
  #     else
  #       #single responsibility
  #       #create method that will find ingredient in ingredient table and return result/results if there is a match
  #       RecipesAPI::Adapter.input_info(input)
  #     end
  #   end
  # end

  #   # def food_allergies
#   #   # Asks user for allergy input
#   #   # Stores allergy input somewhere #####
#   #   # Removes those ingredients from options.
#   #   puts "If you have any food allergies, please list them here. We're here to help you, not hurt you!"
#   #   puts "Type none if you have no allergies."
#   #   puts "Examples: gluten, shellfish, peanuts, etc."
#   #   allergies = gets.chomp
#   #   if allergies.downcase == "none"
#   #     # Do not filter any recipes
#   #     puts "\nLucky you!\n\n"
#   #   else
#   #     # Remove recipes that contain allergens
#   #     puts "\nDon't worry, we won't include any #{allergies}!\n\n"
#   #   end
