class Game
  MAX_NUMBER_OF_GUESSES = 12

  def initialize(code = nil)
    @code = code ? code : SecretCode::generate_code
    @solved = false
    @number_of_guesses = 0
  end

  def play(player)
    feedback = nil
    until @solved || @number_of_guesses == MAX_NUMBER_OF_GUESSES
      guess = player.guess(feedback)
      puts "#{player.class} guessed: #{guess.join(' ')}"
      feedback = Game::evaluate_guess(guess, @code)
      puts feedback
      @number_of_guesses += 1
      if feedback.correct_position == SecretCode::NUMBER_OF_PEGS
        @solved = true
        puts "Solved!"
        puts "#{player.class} solved it in #{@number_of_guesses} guesses!"
        
      else
        puts "#{MAX_NUMBER_OF_GUESSES - @number_of_guesses} guesses left"
      end
    end
    puts "#{player.class} out of guesses. The code was #{@code.join(' ')}" unless @solved
  end

  private

  def self.evaluate_guess(guess, code)
    correct_position_count = 0
    wrong_position_count = 0
    guess.each_with_index do |peg, index|
      if code[index] == peg
        correct_position_count += 1
      elsif code.include?(peg)
        wrong_position_count += 1
      end
    end
    Feedback.new(correct_position_count, wrong_position_count)
  end
end
