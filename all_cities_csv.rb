# encoding: utf-8
require 'csv'
require 'json'

def load_from_file( filename )
  File.open( filename, "r" ) do |f|
    JSON.load( f )
  end
end

results = []
allCities = load_from_file('newCities.json')

allCities.each do |city|
  results << city["city"]
end

File.open("citiesForCSV.json","w") do |f|
  f.write(results.to_json)
end

csv_string = CSV.generate do |csv|
  JSON.parse(File.open("newCities.json").read).each do |hash|
    csv << hash.values
  end
end

puts csv_string

CSV.open("citiesCountries.csv", "w") do |csv| #open new file for write
  JSON.parse(File.open("newCities.json").read).each do |hash| #open json to parse
    csv << hash.values #write value to file
  end
end