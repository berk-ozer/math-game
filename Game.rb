class Game
  def initialize
    
  end

  # Presents instructions before starting game
  def begin
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Welcome to the Math Game!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Each player has 3 lives, and you lose a life\nwhen you answer a question incorrectly."
    puts "----"
    puts "When either one of the players runs out of\nlives, the game ends."
    puts "----"
    puts "If you're ready to start, type 'y' in the prompt"
    ask_to_start
  end

  # Asks each player if they are ready to start
  def ask_to_start
    (1..2).each do |id|
      puts "\nPlayer #{id}: Ready to start?"
      print "> "
      answer = gets.chomp
      # Keep asking until they answer "y"
      while (answer != "y")
        puts "Please type 'y' to start. Ready to start?"
        print "> "
        answer = gets.chomp
      end
    end
    puts "\n~~~~~~~~~~ The Game starts now! ~~~~~~~~~~"
    ask_question
  end

  # Asks the current player a question
  def ask_question
    question = Question.new
    puts "\nPlayer 1: #{question.text}"

    print "> "
    player_answer = gets.chomp.to_i

    # Checks to see if they answered correctly
    if(player_answer == question.correct_answer)
      puts "Player 1: YES! You are correct!"
    else 
      puts "Player 1: Seriously? No!"
    end
  end
end