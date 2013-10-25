# encoding: utf-8

require 'json'

def load_from_file( filename )
  File.open( filename, "r" ) do |f|
    JSON.load( f )
  end
end

grouped_by_cities = load_from_file('cities.json')
grouped_by_countries = Hash.new


grouped_by_cities.each do |city|

  # create the country if not yet in hash
  grouped_by_countries.store(city["country"], []) unless grouped_by_countries.has_key?(city["country"])

  # group cities into each country
  grouped_by_countries[city["country"]] << city["city"]
end

puts grouped_by_countries

File.open("countries.json","w") do |f|
  f.write(grouped_by_countries.to_json)
end