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

  def food_allergies(al_ary) #matt

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

  def cuisine_pref #matt

  end

end
