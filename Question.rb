class Question
  def initialize
    @num1 = rand(20) + 1
    @num2 = rand(20) + 1
  end
  
  def text
    "What does #{@num1} + #{@num2} equal?"
  end

  def correct_answer
    @num1 + @num2
  end
end