require 'rest-client'
require 'json'
require 'pry'
require 'pry-byebug'

def request_url(url)
  RestClient.get(url)
end

def parse_json(response_string)
  JSON.parse(response_string)
end

def find_character(response_hash, character_name)
  response_hash["results"].find do |character|
    character["name"].downcase == character_name
  end
end

def get_character_films(character)
  character["films"].map do |film|
    film_string = request_url(film)
    parse_json(film_string)
  end
end

def get_character_movies_from_api(character_name)
  #make the web request
  url = 'http://swapi.dev/api/people'

  response_string = request_url(url)
  response_hash = parse_json(response_string)

  character = find_character(response_hash, character_name)


  # character_films = character["films"].map do |film|
  #   film_string = RestClient.get(film)
  #   JSON.parse(film_string)
  # end

  get_character_films(character)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(character_films)
  # some iteration magic and puts out the movies in a nice list
  character_films.each do |film|
    puts "\nTitle: #{film["title"]}"
    puts "Producer(s): #{film["producer"]}"
    puts "Release date: #{film["release_date"]}\n"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
