class Mode
  def initialize( mode = nil)
    if mode == :computer
      puts "Enter the secret code: #{SecretCode::NUMBER_OF_PEGS} digits (#{SecretCode::PEG_RANGE}) separated by spaces"

      inputCode = gets.chomp.split.map { |peg| peg.to_i }

      until SecretCode::valid_code?(inputCode)
        puts "Invalid input. Enter the secret code with: #{SecretCode::NUMBER_OF_PEGS} unique digits (#{SecretCode::PEG_RANGE}) separated by spaces"

        inputCode = gets.chomp.split.map { |peg| peg.to_i }
      end



      Game.new(inputCode).play(ComputerPlayer.new)
    else
      Game.new.play(Player.new)
    end
  end


end