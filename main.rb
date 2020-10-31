require 'json'


# convert json data to string
json_string = File.read("Apprentice_TandemFor400_Data.json")

# parse and convert json string to hash
questions_array = JSON.parse(json_string)

# shuffle questions so they are in randon order for every round
questions_array.shuffle!

puts questions_array