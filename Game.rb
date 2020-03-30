class Game
  def initialize
    
  end

  # Presents instructions to start the game
  def start_game
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
    (1..2).each do |num|
      puts "\nPlayer #{num}: Ready to start?"
      print "> "
      answer = gets.chomp
      while (answer != "y")
        puts "Please type 'y' to start. Ready to start?"
        print "> "
        answer = gets.chomp
      end
    end
    puts "\n~~~~~~~~~~ The Game starts now! ~~~~~~~~~~"
  end
end