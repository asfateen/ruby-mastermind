class Player
    def guess(feedback = nil)
      loop do
        puts "Enter your guess: #{Config::NUMBER_OF_PEGS} digits (#{Config::PEG_RANGE}) separated by spaces"
        input = gets.chomp.split.map { |peg| peg.to_i }
        if SecretCode::valid_lineup?(input)
          return input
        else
          puts "Invalid input. Please enter exactly #{Config::NUMBER_OF_PEGS} digits, each between #{Config::PEG_RANGE.min} and #{Config::PEG_RANGE.max}."
        end
      end
    end
    
end

class ComputerPlayer < Player
  def initialize
    @previous_guess = nil
    @possibilities_no_duplicates = Config::PEG_RANGE.to_a.permutation(Config::NUMBER_OF_PEGS).to_a
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