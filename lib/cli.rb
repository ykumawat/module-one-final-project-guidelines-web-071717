class CommandLineInterface

  def greet
    puts ""
    puts ""
    puts "
                                           ~               OOOO8
                                         :OO              OO   O
               .                      .   OO  ..7..      8O.   8  . ?.     ...
       . ...  O8.            8    OO8OOO8  O. 8O  O      OO       8O.8O.   8OOO  OO+...
    OOOO .OO   O     7O88   .OO   O ?OO 8.O?  O.  O      OO.     OO. :OZ  OO  O7 .8O8  88.8OOO.
     OO?  OO.  8 8OO. 8O8   .O8   O .OO  .    OO         OO.    .OO   O8 O8   OO. OO. OI  .O8. 8O   8OZ    .
      OO  OO8..O  :O8. OO.  .OO8.    O8       OOOO       OO     .OO.  O8 O8   OO. O8.8.   8O8  8O.  OO   O8OO8..
      =OO ?8O+ O  .OO  OO    IO8 .   8O        8OO8      8O      OO.  O8 O8   OO  O8O     OO   OOO  O  ~OO    +.
       8O  .8O.O  .OOOO8O     .OO    OO          OO=     OO      OO  ZO8 OO  .8O .OOOO    OO   OOO  O  OO.   :
        OO. I88O   OO+ 8OO  ? .OO .  OO.         .OO     OO     .OO. OO: O8  OO: OO O8   .8O  8=OOO O $O8
        OO.: OO8    OO .OO  O?  8O   8O.      O. .O7      OO  .. OO. 8O  OO  OO. 8O OOO  $OO  O..OOO. OO.  .
         OOO  O8.   OO. OO  O  .OOZ  8O8      O8~88       .O8O8O..O88O.  +O +O.  8O  O8  OO   O .OOO  OO. OOO
         =8O. 8O.   OO  8O7.8O .OOO. O~..                                 .OO   OOOO OOO:8O  +O  8OO. 8O   O8
         .OO  .8   7OO8 $O....                                                      .    :OOZOO   O.  O8  88.
           O                                                                                      ~    O  OO
                                                                                                       .Z88?
"
    puts "Welcome to the fastest solution for finding the recipe of your dreams!"
    puts ""
  end

  def food_ingredient_selections #with examples

    options = Recipe.all_categories.uniq!.flatten!
    puts "Enter your food preferences (like 'vegan' or 'lunch') so we can find you a recipe."
    puts "  - If you have no preference, enter 'Random' - "
    selection = gets.chomp.capitalize!
    # binding.pry

    while (selection != "Random" && selection.downcase != "random") && !options.include?(selection)
      puts "Please enter something valid!"
      selection = gets.chomp.capitalize!
    end

    puts "Yum!!! you selected #{selection}."
    puts ""
    if selection == 'Random'
      RecipesAPI::Adapter.random_recipe
    else
      puts "Add any ONE specific ingredient that you'd like."
      puts " - Add things like: 'ginger', 'asparagus', 'lentil', 'chicken', etc. \n"
      selection2 = gets.chomp
      recipes =  RecipesAPI::Adapter.food_ingredient_pref(selection, selection2)
      if !recipes.empty?
        next_page(recipes)
      else
        game_over
      end
    end
  end

  def selection_valid(input)
    Recipe.all.each do |recipe|
      if recipe.category.include?(input)
        true
      else
        false
      end
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
      puts recipe.title.upcase
      puts "------------------------------------------------------------"
      puts "Ingredients:"
      recipe.ingredients.map {|ingredient| puts ingredient.name}
      puts "------------------------------------------------------------"
      puts "\n"
      puts "Directions:"
      puts recipe.directions
      puts "------------------------------------------------------------"
      puts "\n"
      puts "Categories:"
      puts "->#{recipe.category}<-"
      puts "============================================================"
      break if satisfied == true || recipes.length == 0
    end
    game_over
  end

  def satisfied#run return values as arg so we can use it!
    puts "Are you happy with your recipe selection? Type yes or no."
    selection = gets.chomp
    if selection == 'yes'
      puts "Enjoy your meal! Thanks for using What's Cooking!"
      true
    else
      false
    end
  end

  def game_over
    puts "Okay! That's it! ...¯|_(ツ)_/¯"
  end

end
