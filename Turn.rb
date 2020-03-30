class Turn
  # Get id and create new Question object
  # Add 1 to id because it's 0 indexed
  def initialize(player_id)
    @id = player_id + 1
    @question = Question.new
  end

  # Asks the current player a question
  # Returns true if they answered correctly, otherwise false
  def ask_question
    puts "Player #{@id}: #{@question.text}"
    print "> "
    player_answer = gets.chomp.to_i

    # Checks to see if they answered correctly
    if (player_answer == @question.correct_answer)
      puts "Player #{@id}: YES! You are correct!"
      true
    else 
      puts "Player #{@id}: Seriously? No!"
      false
    end
  end
end