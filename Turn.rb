class Turn
  # Get id for display purposes and create new Question object
  def initialize(player_id)
    @id = player_id 
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