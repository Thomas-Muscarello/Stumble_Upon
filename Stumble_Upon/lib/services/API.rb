
require "pry"
class API

    BASE_URI = "https://api.openbrewerydb.org/breweries"
  
     # find a brewery by name
    def find_brewery_by_name(name)
      #name = str.downcase.tr!(" ", "_")
      uri = URI(BASE_URI + "?by_name=#{name}")
      brewery = make_request(uri)
      if brewery[0]
        Brewery.new(brewery[0])
      else
        "Couldn't find a brewery with that name..."
      end
    end

    #find a brewery by city
    def find_brewery_by_city(city)
      uri = URI(BASE_URI + "?by_city=#{city}")
      brewery = make_request(uri)
      
      if brewery[0]
        Brewery.new(brewery[0])
      else
        "Couldn't find a brewery in that city..."
      end
    end


    #find a brewery by type
    def find_brewery_by_type(type)
      uri = URI(BASE_URI + "?by_type=#{type}")
      brewery = make_request(uri)
      if brewery[0]
        Brewery.new(brewery[0])
      else
        "Couldn't find a brewery with that type..."
      end
    end
  
  
    # Method to make and return the request
    def make_request(uri)
      response = Net::HTTP.get_response(uri)
      
      #code = response.code

      #if code == "200" 
      JSON.parse(response.body)
      #else
      #  "Error".colorize(:red)
      #end
      
    end
  
  end