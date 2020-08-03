require "pry"
class CLI
  #meat of my program
 

  attr_accessor :active_user, :prompt
  def initialize
    @active_user = nil
    @prompt = TTY::Prompt.new
  end

  def run
      system("clear")
      @user_input = nil
      @api = API.new
    
      welcome
      until @user_input == "5"
        "\n"
        main_menu
      end 
  end
  
  def welcome
      puts "
      ---It seems like you are looking for a brewery---
      --Luckily, you have stumbled upon the right app--
      ---------------Stumbled Upon---------------------
      ".colorize(:blue)
      "\n"
      self.intro
  end

  def intro
      puts "Lets get to know some stuff about you first!"
      print "Please enter a username: "
      username =gets.chomp
      print "Nice to meet you #{username}. What city are you most near? "
      city = gets.chomp.to_s
      print "Lastly, what is your favorite style of beer? "
      favorite_beer_style = gets.chomp.to_s
      self.new_user(username, city, favorite_beer_style)
      system "clear"
      self.main_menu
  end

  def new_user(username, city, favorite_beer_style)
      @active_user = User.new(username, city, favorite_beer_style)
  end

  def main_menu 
      puts"\n"
      puts"How would you like to search for a Brewery?"
      puts ["1. Search for a specific Brewery".colorize(:cyan),
       "2. Find a brewery in your city".colorize(:cyan),
       "3. Find a brewery by type".colorize(:cyan),
       "4. View your profile".colorize(:cyan),
       "5. Exit".colorize(:red)]
  
      @user_input = gets.chomp
  
      if @user_input == "1"
        search_brewery_by_name
      elsif @user_input == "2"
        search_brewery_by_city
      elsif @user_input == "3"
        search_brewery_by_type
      elsif @user_input == "4"
        user_profile
      elsif @user_input == "5"
        puts "Cheers!".colorize(:yellow)
        exit
      else
        puts "Input does not exist".colorize(:red)
      end
  end

  def user_profile
      system "clear"
      puts "Username:".colorize(:green)+@active_user.username
      puts "City:".colorize(:green)+@active_user.city
      puts "Favorite Beer Style:".colorize(:green)+@active_user.favorite_beer_style
  end
  


  def search_brewery_by_name
      print "What brewery would you like to search for? ".colorize(:green)
      input = gets.chomp
      brewery = @api.find_brewery_by_name(input)
   # binding.pry
      if brewery.class == Brewery
      brewery.pretty_print
      else
       puts "We couldnt find a brewery by that name".colorize(:red)
      end
  end
  
  def search_brewery_by_city
      print "What city would you like to search for a brewery in? ".colorize(:green)
      input = gets.chomp
      brewery = @api.find_brewery_by_city(input)
      if brewery.class == Brewery
        binding.pry
        brewery.pretty_print
        else
         puts "We couldn't find a city by that name".colorize(:red)
        end
  end

  def search_brewery_by_type
    input = @prompt.select(
     "What type of Brewery are you looking for? 
      Your options are:", 
      ["micro",
      'regional',
      'brewpub',
      'large',
      'planning',
      'bar',
      'contract',
      'proprietor'])
      brewery = @api.find_brewery_by_type(input)
      brewery.pretty_print
  end
  
end