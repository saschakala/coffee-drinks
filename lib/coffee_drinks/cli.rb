
class CLI

  def initialize
      Scraper.scrape_drinks
  end


  def call
      greeting
      puts "\nType 'list' to see a list of espresso beverages.\n\n** alternatively, for the lactose challenged, type 'milk' or 'no milk' to see drinks that both will and won't give you indigestion **"
      puts"\n --> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--".colorize(:color => :light_blue, :background => :white)
      menu_main
  end


  def menu_main
      input = gets.chomp.downcase
      if input == "list"
          list_drinks
          puts "\nWhat's in a name? A drink by any other name would taste as sweet."
          menu_details
      elsif input == "milk"
          milk_drinks
          puts "\nLiving a life of lactose luxury, I see."
          menu_milk
      elsif input == "no milk"
          no_milk_drinks
          puts "\nFunfact: approximately 65% of the human population has a reduced ability to digest lactose after infancy. You are not alone."
          menu_no_milk
      elsif input == "exit"
          puts "\nI know, I know: our latte art needs work. But wait, how about a nice strong cup of tea?".colorize(:magenta)
          sleep(2)
          tea_menu_details
      else 
          try_again_boost
          puts "\n--> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--".colorize(:color => :light_red, :background => :white)
          menu_main
      end
  end

  def menu_details
      puts "\nTo learn more about a specific beverage enter its corresponding number below or type 'exit' to leave.".colorize(:color => :light_blue, :background => :white)
      input = gets.chomp.downcase
      if input == "exit"
          puts "\nAre you, perhaps, more of a tea person?".colorize(:magenta)
          sleep(2)
          tea_menu_details
      elsif !input.to_i.between?(1, Drink.all.count)
          list_drinks
          doesnt_exist
          menu_details 
      else
          drink = Drink.sorted_all[input.to_i-1]
          drink_details(drink)
          puts "\nWould you like to see another drink (y / n), view brews by milk content (milk / no milk), or could we perhaps interest you in a German pastry to go with your coffee (pastry)?".colorize(:color => :light_blue, :background => :white)
          menu_details_second
      end
  end

  def menu_details_second
      round_two = gets.chomp.downcase 
      if round_two == "n" || round_two == "exit"
          puts "\nWhat about a nice cup of tea (y / n)?".colorize(:magenta)
          tea_menu
      elsif round_two == "milk"
          milk_drinks
          menu_milk
      elsif round_two == "no milk"
          no_milk_drinks
          menu_no_milk
      elsif round_two == "pastry"
          pastry_menu_details
      elsif round_two == "y"
          list_drinks
          # puts "\nSelect a number to get drink details or type 'exit' to leave.".colorize(:color => :light_blue, :background => :white)
          menu_details
      else 
          try_again_boost
          puts "\n--> enter 'y', 'milk', 'no milk', or 'pastry' to stay, and 'n' to leave <--".colorize(:color => :light_red, :background => :white)
          menu_details_second
      end
  end


  def menu_milk
      puts "\nSelect a number to learn more about your favorite drink's fuel to foam ratio or enter 'exit' to leave.".colorize(:color => :light_blue, :background => :white)
      input = gets.chomp.downcase
      if input == "exit"
          puts "\nMaybe some tea would help?".colorize(:magenta)
          sleep(2)
          tea_menu_details
      elsif !input.to_i.between?(1, Drink.milk.count)
          milk_drinks
          doesnt_exist
          menu_milk
      else
          drink = Drink.sorted_milk[input.to_i-1]
          drink_details(drink)
          puts "\nWould you like to see another drink (y / n), visit the main or milk-free beverage lists (main / no milk), or could we perhaps tempt you with a German pastry (pastry)?".colorize(:color => :light_blue, :background => :white)
          menu_milk_second
      end
  end

  def menu_milk_second
      round_two = gets.chomp.downcase 
      if round_two == "n" || round_two == "exit"
          psych
          tea_menu
      elsif round_two == "y"
          milk_drinks
          menu_milk
      elsif round_two == "main"
          list_drinks
          menu_details
      elsif round_two == "no milk"
          no_milk_drinks
          menu_no_milk
      elsif round_two == "pastry"
          pastry_menu_details
      else 
          try_again_boost
          puts "\n--> enter 'y', 'main', 'no milk', or 'pastry' to stay, and 'n' to leave <--".colorize(:color => :light_red, :background => :white)
          menu_milk_second
      end
  end


  def menu_no_milk
      puts "\nSelect a number to learn more about your favorite milk-free drink or type 'exit' to leave.".colorize(:color => :light_blue, :background => :white)
      input = gets.chomp.downcase
      if input == "exit"
          puts "These warm drinks definitely don't have milk - maybe you're more interested in tea?".colorize(:magenta)
          sleep(2)
          tea_menu_details
      elsif !input.to_i.between?(1, Drink.no_milk.count)
          no_milk_drinks
          doesnt_exist
          menu_no_milk
      else
          drink = Drink.sorted_no_milk[input.to_i-1]
          drink_details(drink)
          puts "\nWould you like to see another drink (y / n), visit the main or milk-containing beverage lists (main / milk), or could we get you a German pastry (pastry) to go with that coffee *lactaid not included* ?".colorize(:color => :light_blue, :background => :white)
          menu_no_milk_second
      end
  end

  def menu_no_milk_second
      round_two = gets.chomp.downcase 
      if round_two == "n" || round_two == "exit"
          psych
          tea_menu
      elsif round_two == "y"
          no_milk_drinks
          menu_no_milk
      elsif round_two == "main"
          list_drinks
          menu_details
      elsif round_two == "milk"
          milk_drinks
          menu_milk
      elsif round_two == "pastry"
          pastry_menu_details
      else 
          try_again_boost
          puts "\n--> enter 'y', 'main', 'milk', or 'pastry' to stay, and 'n' to leave <--".colorize(:color => :light_red, :background => :white)
          menu_no_milk_second
      end
  end

  def tea_menu
      input = gets.chomp.downcase
      if input == "y"
          tea_menu_details
      elsif input == "n" || input == "exit"
          puts "May your coffee kick in before reality does.".colorize(:green)
          puts <<-DOC
               ((((
              ((((
               ))))
            _ .---.
           ( |`---'|
             \|     |
            : .___, :
             `-----'
          DOC
      else 
          try_again_boost
          puts "\n--> enter 'y' to stay (and learn about tea) or 'n' to leave <--".colorize(:color => :light_red, :background => :white)
          tea_menu
      end
  end


  def tea_menu_details
      if Tea.all.count > 0
          list_teas
      else
          Scraper.scrape_tea
          list_teas
      end
      puts "\nTo learn more about a type of tea enter its corresponding number below.".colorize(:color => :light_blue, :background => :white)
      puts "\n(Or if you really want to leave we promise this time we'll let you...just enter 'exit' here.)"
      input = gets.chomp.downcase
      if input == "exit"
          puts "No need to be sal-tea.".colorize(:green)
          puts <<-DOC
               ((((
              ((((
               ))))
            _ .---.
           ( |`---'|
             \|     |
            : .___, :
             `-----'
          DOC
      elsif !input.to_i.between?(1, Tea.all.count)
          list_teas
          doesnt_exist
          tea_menu_details_clone
      else
          tea = Tea.sorted_all[input.to_i-1]
          tea_details(tea)
          puts "\nWould you like to see another tea (y / n) or could we perhaps interest you in a German pastry (pastry)?".colorize(:color => :light_blue, :background => :white)
          tea_menu_details_second
      end
  end

  def tea_menu_details_clone
      if Tea.all.count > 0
          list_teas
      else
          Scraper.scrape_tea
          list_teas
      end
      puts "\nTo learn more about a type of tea enter its corresponding number below.".colorize(:color => :light_blue, :background => :white)
      input = gets.chomp.downcase
      if input == "exit"
          puts "No need to be sal-tea.".colorize(:blue)
          puts <<-DOC
               ((((
              ((((
               ))))
            _ .---.
           ( |`---'|
             \|     |
            : .___, :
             `-----'
          DOC
      elsif !input.to_i.between?(1, Tea.all.count)
          list_teas
          doesnt_exist
          tea_menu_details_clone
      else
          tea = Tea.sorted_all[input.to_i-1]
          tea_details(tea)
          puts "\nWould you like to see another tea (y / n) or could we perhaps interest you in a German pastry (pastry)?".colorize(:color => :light_blue, :background => :white)
          tea_menu_details_second
      end
  end

  def tea_menu_details_second
      round_two = gets.chomp.downcase 
      if round_two == "n" || round_two == "exit"
          puts "What do you call a sad cup of coffee? A depresso.".colorize(:green)
          puts <<-DOC
               ((((
              ((((
               ))))
            _ .---.
           ( |`---'|
             \|     |
            : .___, :
             `-----'
          DOC
      elsif round_two == "y"
          tea_menu_details_clone
      elsif round_two == "pastry"
          pastry_menu_details_tea
      else 
          try_again_boost
          puts "\n--> enter 'y', 'n', or 'pastry' <--".colorize(:color => :light_red, :background => :white)
          tea_menu_details_second
      end
  end


  def pastry_menu_details
      if Pastry.all.count > 0
          list_pastries
      else
          Scraper.scrape_pastries
          list_pastries
      end
      puts "\nTo learn more about a pastry enter its corresponding number below.".colorize(:color => :light_blue, :background => :white)
      input = gets.chomp.downcase
      if input == "exit"
          puts "Not so fast, how about some tea?".colorize(:magenta)
          tea_menu_details
      elsif !input.to_i.between?(1, Pastry.all.count)
          list_pastries
          try_again_boost
          pastry_menu_details
      else
          pastry = Pastry.sorted_all[input.to_i-1]
          pastry_details(pastry)
          puts "\nWould you like to see another pastry (y / n) or maybe you're ready for some tea (tea) or more coffee (coffee)?".colorize(:color => :light_blue, :background => :white)
          pastry_menu_details_second
      end
  end

  def pastry_menu_details_tea
      if Pastry.all.count > 0
          list_pastries
      else
          Scraper.scrape_pastries
          list_pastries
      end
      puts "\nTo learn more about a pastry enter its corresponding number below.".colorize(:color => :light_blue, :background => :white)
      input = gets.chomp.downcase
      if input == "exit"
          puts "Not so fast, how about some tea?".colorize(:magenta)
          tea_menu_details
      elsif !input.to_i.between?(1, Pastry.all.count)
          list_pastries
          try_again_boost
          pastry_menu_details
      else
          pastry = Pastry.sorted_all[input.to_i-1]
          pastry_details(pastry)
          puts "\nWould you like to see another pastry (y) or maybe you're ready to gtfo of this program (GET ME OUTTA HERE)?".colorize(:color => :light_blue, :background => :white)
          pastry_menu_details_second_tea
      end
  end

  def pastry_menu_details_second
      round_two = gets.chomp.downcase 
      if round_two == "n" || round_two == "exit"
          puts "Sometimes we go hours without drinking coffee. It’s called sleeping.".colorize(:green)
          puts <<-DOC
               ((((
              ((((
               ))))
            _ .---.
           ( |`---'|
             \|     |
            : .___, :
             `-----'
          DOC
      elsif round_two == "y"
          pastry_menu_details
      elsif round_two == "tea"
          tea_menu_details_clone
      elsif round_two == "coffee"
          list_drinks
          menu_details
      else 
          try_again_boost
          puts "\n--> enter 'y', 'n', 'tea', or 'coffee' <--".colorize(:color => :light_red, :background => :white)
          pastry_menu_details_second
      end
  end

  def pastry_menu_details_second_tea
      round_two = gets.chomp.downcase 
      if round_two == "get me outta here" || round_two == "exit" || round_two == "no"
          puts "Sometimes we go hours without drinking coffee. It’s called sleeping.".colorize(:green)
          puts <<-DOC
               ((((
              ((((
               ))))
            _ .---.
           ( |`---'|
             \|     |
            : .___, :
             `-----'
          DOC
      elsif round_two == "y"
          pastry_menu_details
      else 
          try_again_boost
          puts "\n--> enter 'y', 'n', 'tea', or 'coffee' <--".colorize(:color => :light_red, :background => :white)
          pastry_menu_details_second_tea
      end
  end


  def list_drinks
      Drink.all.sort_by {|drink| drink.name}.tap{|drink| drink.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}}
  end
  
  def milk_drinks
      Drink.milk.sort_by {|drink| drink.name}.tap{|drink| drink.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}}
  end
  
  def no_milk_drinks
      Drink.no_milk.sort_by {|drink| drink.name}.tap{|drink| drink.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}}
  end

  def list_pastries
      Pastry.all.sort_by {|pastry| pastry.name}.tap{|pastry| pastry.each.with_index(1) { |pastry, i| puts "#{i}. #{pastry.name}"}}
  end

  def list_teas
      Tea.all.sort_by {|tea| tea.name}.tap{|tea| tea.each.with_index(1) { |tea, i| puts "#{i}. #{tea.name}"}}
  end


  def drink_details (drink)
      puts "\nOrder up! One #{drink.name}:"
      puts "\n#{drink.description}"
      puts "\n#{drink.ratio}"
      puts "#{drink.cup}"
      puts "Milk: #{drink.milk}"
  end

  def tea_details (tea)
      puts "\nOrder up! One #{tea.name}:"
      puts "\n#{tea.description}"
      puts "\n#{tea.flavor}"
      puts "\n#{tea.varieties}"
  end

  def pastry_details (pastry)
      puts "\nOrder up! One #{pastry.name}:"
      puts "\n#{pastry.description}"
  end



  def greeting
      puts "Hello! And welcome to the Bevvie Bevy: an interactive experience for coffee connoisseurs and novices alike.".colorize(:color => :cyan, :background => :black)
      puts"\nHave you ever wondered what the difference is between a flat white and long black? If so, the Bevy is here to help."
  end

  def try_again_boost
      puts "\nLooks like you need a boost of caffeine! Give it another go, we didn't quite catch that.".colorize(:light_red)
  end

  def doesnt_exist
      puts "\nLooks like that drink doesn't exist yet! Try again, captain.".colorize(:light_red)
  end

  def psych
      puts "\nHow about a cup of tea before you go (y / n)?".colorize(:magenta)
  end

end


