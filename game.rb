class Game
  NUMBER_OF_PEGS_IN_CODE = 4
  MAX_NUMBER_OF_GUESSES = 12
  PEG_RANGE = (1..6)

  def initialize
    @code = Array.new()
    @code += generate_code
    @solved = false
    @number_of_guesses = 0
  end

  def initialize(code)
    @code = code.dup
    @solved = false
    @number_of_guesses = 0
    computer_solve
 
  end

  def feedback(guess)
    correct_position_count = 0
    wrong_position_count = 0

    @code.each_index do |i|
      if @code[i] == guess[i]
        correct_position_count += 1
      elsif guess.include?(@code[i])
        wrong_position_count += 1
      end
    end

    if correct_position_count == NUMBER_OF_PEGS_IN_CODE
      puts "Solved!"
      @solved = true
      return
     end
    puts "#{correct_position_count} of your pegs are correctly placed"

    puts "#{wrong_position_count} of your pegs are present but incorrectly placed"
    puts "You have #{MAX_NUMBER_OF_GUESSES - @number_of_guesses - 1} guesses left"
    return [correct_position_count,wrong_position_count]

  end

  def play
    until @solved || @number_of_guesses == MAX_NUMBER_OF_GUESSES
      puts "Enter your guess #{NUMBER_OF_PEGS_IN_CODE} digits (#{PEG_RANGE}) separated by a space"
      input = gets
      guess = input.split
      feedback(guess)
      @number_of_guesses += 1

    end
    unless @solved
      puts "You are out of guesses"
      puts "The code was #{@code.join(' ')}"
    end

  end

  private

  def generate_code
    code = Set.new()

    code << rand(PEG_RANGE).to_s until code.length == 4
    
    code.to_a
  end


  def computer_solve
    past_guesses=[]
    until @solved || @number_of_guesses == MAX_NUMBER_OF_GUESSES
      puts "Computer guessed: "
      guess = PEG_RANGE.to_a.sample(4).join(' ').split
      while past_guesses.include?(guess)
        guess = PEG_RANGE.to_a.sample(4).join(' ').split
      end
      past_guesses << guess
      p guess
      feedback(guess)
      @number_of_guesses += 1
    end
    unless @solved
      puts "You are out of guesses"
      puts "The code was #{@code.join(' ')}"
    end
  end
  

  



end



# game = Game.new()
# game.play
puts "Enter your guess #{Game::NUMBER_OF_PEGS_IN_CODE} digits (#{Game::PEG_RANGE}) separated by a space"
code = gets.chomp
game = Game.new(code.split)