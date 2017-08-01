class CommandLIneInterface
  def greet
    puts "What's Cookin'?"
    puts "Welcome to the fastest solution for your cooking needs!"
    puts "Simply enter what ingredients you have in your kitchen."
  end

  def enter_ingredients(in_ary) #minimum of three ingredients UNLESS user types "random"

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