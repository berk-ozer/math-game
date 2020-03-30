class Player
  attr_reader :current_lives, :id

  def initialize(id)
    @id = id
    @current_lives = 3
  end

  # Game calls this when player answers question incorrectly
  def lose_life
    @current_lives -= 1
  end
end