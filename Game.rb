class Game
  # Create two Player objects, starting game with Player 1
  def initialize
    @player_1 = Player.new(1)
    @player_2 = Player.new(2)
    @players = [@player_1, @player_2]
    @current_player = 0
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
    puts "\n~~~~~~~~~~ GAME STARTS NOW! ~~~~~~~~~~"
    next_turn
  end

  # Starts the next turn, asking the current player a question
  def next_turn
    turn = Turn.new(@current_player)
    player_answer = turn.ask_question

    # Player loses life if they answered incorrectly
    if (player_answer == false) 
      @players[@current_player].lose_life
    end

  end

  # Switches to the other player when a turn ends
  def switch_player
    @current_player = @current_player == 1 ? 2 : 1
  end

end