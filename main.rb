require 'json'


# convert json data to string
json_string = File.read("Apprentice_TandemFor400_Data.json")

# parse and convert json string to hash
questions_array = JSON.parse(json_string)

# shuffle questions so they are in randon order for every round
questions_array.shuffle!

score = 0
question_number = 1

puts "\n" # new line
puts "Welcome to the Quiz Show!" + "\n" + "Choose your answers by entering the corresponding number."
# puts "Press 's' to start the round."


# loop over the first 10 questions
for q in questions_array[0..1] do
  puts "\n" # new line

  puts "Question #{question_number}: #{q["question"]}"

  answers = q["incorrect"].push(q["correct"]).shuffle!

  for a in answers do
    puts "(#{answers.index(a)}) #{a}"
  end

  response = gets

  if answers[response.to_i] == q["correct"]
    score += 1
    puts "That's correct!"
  else
    puts "Sorry, that's incorrect!"
    puts "The correct answer is #{q["correct"]}"
  end
  puts "Score: #{score} pts"

  question_number += 1

  puts "\n" # new line


end

puts "Quiz completed!"
puts "You answered #{score} out of 10"
if score == 10
  puts "You got a perfect score! Way to go!"
end


puts "Thanks for playing!"
