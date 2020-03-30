class Game
  # Create two Player objects, starting game with Player 1
  def initialize
    @player_1 = Player.new(1)
    @player_2 = Player.new(2)
    @current_player = @player_1
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

  # Starts the turn, asking the current player a question
  # Goes into next turn if players didn't lose
  def next_turn
    turn = Turn.new(@current_player.id)
    player_answer = turn.ask_question

    # Player loses life if they answered incorrectly
    if (player_answer == false) 
      @current_player.lose_life
    end
      
    show_scores

    # If player is out of lives, end game
    # Otherwise, go to next turn
    if (@current_player.current_lives == 0)
      end_game
    else 
      switch_player
      puts "\n----- NEW TURN -----"
      next_turn
    end
  end

  # Switches to the other player when a turn ends
  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  # Shows both players remaining lives as their score
  def show_scores
    puts "P1: #{@player_1.current_lives}/3 vs P2: #{@player_2.current_lives}/3"
  end

  # Announces the winner and ends game 
  def end_game
    puts "\nPlayer #{@current_player.id} is out of lives!"
    switch_player

    puts "Player #{@current_player.id} wins with a score of #{@current_player.current_lives}/3"

    puts "\n----- GAME OVER -----"
    puts "Thank you for playing, good bye!"
    exit(0)
  end
end