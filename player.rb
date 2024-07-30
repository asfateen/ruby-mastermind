class Player
    def guess(feedback = nil)
      loop do
        puts "Enter your guess: #{SecretCode::NUMBER_OF_PEGS} digits (#{SecretCode::PEG_RANGE}) separated by spaces"
        input = gets.chomp.split.map { |peg| peg.to_i }
        if SecretCode::valid_lineup?(input)
          return input
        else
          puts "Invalid input. Please enter exactly #{SecretCode::NUMBER_OF_PEGS} digits, each between #{SecretCode::PEG_RANGE.min} and #{SecretCode::PEG_RANGE.max}."
        end
      end
    end
    
end

class ComputerPlayer < Player
  def initialize
    @previous_guess = nil
    @possibilities_no_duplicates = SecretCode::PEG_RANGE.to_a.permutation(SecretCode::NUMBER_OF_PEGS).to_a
  end

  def guess(feedback) # eliminates possible solutions based on feedback
    if @previous_guess
      @possibilities_no_duplicates = @possibilities_no_duplicates.select do |prospect|
        Game::evaluate_guess(@previous_guess, prospect).to_s == feedback.to_s
      end
    end
    new_guess = @possibilities_no_duplicates.pop
    @previous_guess = new_guess
    new_guess
  end

end