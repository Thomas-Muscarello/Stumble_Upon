class Brewery

    attr_reader :name, :brewery_type, :street, :city,
    :state, :postal_code, :country, :website_url
    @@all = []
  
    def initialize(brewery_data)
      @name = brewery_data["name"]
      @brewery_type = brewery_data["brewery_type"]
      @street = brewery_data["street"]
      @city = brewery_data["city"]
      @state = brewery_data["state"]
      @postal_code = brewery_data ["postal_code"]
      @country = brewery_data["country"]
      @website_url = brewery_data ["website_url"]
    
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_by_name(name)
      @@all.find { |brewery| brewery.name.downcase == name.downcase }
    end


    def self.find_by_city(city)
      @@all.find { |brewery| brewery.city.downcase == city.downcase }
    end

    def self.find_by_type(type)
      @@all.find { |brewery| brewery.type.downcase == type.downcase }
    end
  
    def pretty_print
      puts @name
      puts "\n"
      puts "Brewery Type:"
      puts @brewery_type
      puts "\n"
      puts "Address:"
      puts @street
      puts "\n"
      puts @city
      puts "\n"
      puts @state
      puts "\n"
      puts @postal_code
      puts "\n"
      puts @country
      puts "\n"
      puts "Website:"
      puts @website_url
      
    end
  
  end