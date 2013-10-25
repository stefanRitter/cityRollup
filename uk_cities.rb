# encoding: utf-8

require 'json'

def load_from_file( filename )
  File.open( filename, "r" ) do |f|
    JSON.load( f )
  end
end

already = ['Belfast', 'Glasgow', 'Cardiff', 'Edinburgh', 'Liverpool', 'Manchester', 'Aberdeen', 'Birmingham', 'Leeds', 'London', 'Newcastle']

complete_city_list = []

uk_cities = load_from_file('uk_cities.json')

uk_cities.each do |city|
  complete_city_list << city['undefined'] unless already.include? city['undefined']
end

File.open("uk_cities_new.json","w") do |f|
  f.write(JSON.pretty_generate complete_city_list)
end