# encoding: utf-8

require 'json'

def load_from_file( filename )
  File.open( filename, "r" ) do |f|
    JSON.load( f )
  end
end

grouped_by_cities = load_from_file('newCities.json')
grouped_by_countries = Hash.new

results = []

grouped_by_cities.each do |city|

  results << { id: city["city"], text: city["city"]}

  # create the country if not yet in hash
  grouped_by_countries.store(city["country"], []) unless grouped_by_countries.has_key?(city["country"])

  # group cities into each country
  grouped_by_countries[city["country"]] << city["city"]
end


File.open("cities_list.json","w") do |f|
  f.write(results.to_json)
end



results = Hash.new

grouped_by_cities.each do |city|
  results[city["city"]] = city["country"]
end

File.open("cities_to_countries.json","w") do |f|
  f.write(results.to_json)
end



results = Hash.new
Country.all.each do |country|
  results[country.name] = country.id
end

File.open("countryIdLookup.json","w") do |f|
  f.write(results.to_json)
end
