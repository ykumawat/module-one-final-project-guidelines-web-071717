class CommandLIneInterface


  def greet
    puts "What's Cookin'?"
    puts ""
    puts "Welcome to the fastest solution for your cooking needs!"
    puts "Simply enter what ingredients you have in your kitchen."
    puts ""
  end


  def enter_ingredients #minimum of three ingredients UNLESS user types "random"
    puts "Please enter a minimum of three ingredients, separated by a comma. If you would like to get a random recipe, type 'Random'."
    puts ""
    input = gets.chomp.downcase
    if input == "random"
      #call on recipe table for random generation
      puts "You selected random!"
      puts "Here is your randomized recipe: "
      #method for random recipe
    else
      input = input.split(', ')
      input.each do |ing|
        #single responsibility
        #create method that will find ingredient in ingredient table and return result/results if there is a match
        puts ing
      end
    end
  end


  def food_allergies
    # Asks user for allergy input
    # Stores allergy input somewhere #####
    # Removes those ingredients from options.
    puts "If you have any food allergies, please list them here. We're here to help you, not hurt you!"
    puts "Type none if you have no allergies."
    puts "Examples: gluten, shellfish, peanuts, etc."
    allergies = gets.chomp
    if allergies.downcase == "none"
      # Do not filter any recipes
      puts "\nLucky you!\n\n"
    else
      # Remove recipes that contain allergens
      puts "\nDon't worry, we won't include any #{allergies}!\n\n"
    end
  end


  def food_prefs #with examples
    puts "Do you have any food preferences that we can help accomodate?"
    puts "Please select one of the following: "
    puts "\n 1. Vegetarian \n 2. Vegan \n 3. Pescetarian \n 4. Gluten-free \n 5. Dairy-free"
    selection = gets.chomp
    case selection
    when "1"
      puts "You selected Vegetarian"
    when "2"
      puts "You selected Vegan"
    when "3"
      puts "You selected Pescetarian"
    when "4"
      puts "You selected Gluten-free"
    when "5"
      puts "You selected Dairy-free"
    end
  end


  def cuisine_pref
    # Asks user for cuisine preferences
    # Stores cuisine preferences somewhere
    # Selects cuisine types from recipes that match those listed
    puts "What are you in the mood for? Identify up to three cuisine preferences here or write none if you have no preference."
    puts "Examples: Italian, sandwich, spicy, etc."
    cuisine_preferences = []
    cuisine_preferences = gets.chomp
    if cuisine_preferences.downcase == "none"
      # do not filter any recipes
      puts "\nOoo, adventurous!\n\n"
    else
      # Select recipes that have specific preference
      puts "\nSounds delish!\n\n"
    end
  end

end