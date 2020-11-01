require 'json'


# convert json data to string
json_string = File.read("Apprentice_TandemFor400_Data.json")

# parse and convert json string to hash
$questions_array = JSON.parse(json_string)


#=================================================================
# Quiz Logic Function
#=================================================================

def start_round
  $score = 0
  $question_number = 1

  # shuffle questions so they are in randon order for every round
  $questions_array.shuffle!

  # loop over the first 10 questions
  for q in $questions_array[0..9] do
    puts "\n" # new line

    #### ask the question
    puts "Question #{$question_number}: #{q["question"]}"

    #### shuffle and display answers
    answers = Array.new(q["incorrect"])
    answers.push(q["correct"]).shuffle!
    answers.each_with_index do |val, idx|
      puts "(#{idx + 1}) #{val}"
    end

    #### get user's answer
    begin
      ansr = Integer(gets)
      raise if ansr < 0 || ansr > answers.length()
    rescue
      puts "INVALID ENTRY! Please enter the number that corresponds to your answer."
      retry
    end



    #### determine if answer is correct
    if answers[ansr.to_i - 1] == q["correct"]
      # increment score
      $score += 1 # no ++ in ruby?
      puts "That's correct!"
    else
      puts "Sorry, that's incorrect!"
      puts "The correct answer is #{q["correct"]}"
    end
    puts "Score: #{$score} pts"

    #### increment question number
    $question_number += 1 # no ++ in ruby?
    puts "\n" # new line
  end

  puts "Quiz completed!"
  puts "You answered #{$score} out of 10"
  if $score == 10
    puts "You got a perfect score! Way to go!"
  end

end


#=================================================================
# Start Gameplay Loop
#=================================================================

while true

  puts "\n" # new line

  puts "Welcome to the Quiz Show!" + "\n" + "Choose your answers by entering the corresponding number."

  start_round()

  puts "Press any key to play again or 'q' to quit."

  replay = gets.chomp.downcase

  if replay == 'q'
    break
  end

end


puts "Thanks for playing!"
