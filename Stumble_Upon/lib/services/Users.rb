class User
    attr_accessor :username, :city, :favorite_beer_style
        @@all= []

def initialize (username, city, favorite_beer_style)
    @username = username
    @city = city
    @favorite_beer_style = favorite_beer_style
    @@all << self
    
end

def user_profile
    [@username, @city, @favorite_beer_style]
end



end

