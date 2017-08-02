class CommandLineInterface

  ####### UNIQ CATEGORIES SUGGESTIONS?! Categories.uniq.rand(10) or something?
  def initialize
    @@return_recipes = []
  end

  def greet
    puts ""
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
    if selection != "5"
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
      end

      puts "Would you like to include any ONE specific ingredient? Please type below:"
      puts "Examples: ginger, asparagus, lentil, chicken, etc."
      selection2 = gets.chomp

###NOW OUR RETURN VALUE IS USABLE W VARIABLE return_recipes

     recipes =  RecipesAPI::Adapter.food_ingredient_pref(selection, selection2)
     if !recipes.empty?
       next_page(recipes)
     else
       game_over
     end
    else
      RecipesAPI::Adapter.random_recipe
    end
  end


# SHOW ME NEXT OPTION
# ASK IF IM satisfied
# IF NO SHOW ME NEXT options
# NEXT OPTION IS SHIFT OF ARRAY

  def next_page(recipes)
    loop do
      recipe = recipes.shift
      puts "\n"
      puts "\n"
      puts "------------------------------------------------------------"
      puts recipe.title
      puts "------------------------------------------------------------"
      puts "Ingredients:"
      recipe.ingredients.map {|ingredient| puts ingredient.name}
      puts "------------------------------------------------------------"
      puts "\n"
      puts recipe.directions
      puts "------------------------------------------------------------"
      puts "============================================================"
      break if satisfied == true || recipes.length == 0 #adding the second part of or statement to get rid of error message
    end
    game_over
  end

  def satisfied#run return values as arg so we can use it!
    puts "Are you happy with your recipe selection? Type yes or no."
    selection = gets.chomp
    if selection == 'yes'
      puts "Enjoy your meal! Thanks for using What's Cooking?!"
      true
    else
      false
    end
  end

  def game_over
    puts "Welp. Too bad. All out of recipes ...¯|_(ツ)_/¯"
  end

end
