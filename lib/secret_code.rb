module SecretCode
  extend self


  def generate_code
    Config::PEG_RANGE.to_a.sample(Config::NUMBER_OF_PEGS)
  end

  def valid_lineup?(input)
    input.length == Config::NUMBER_OF_PEGS && input.all? { |peg| Config::PEG_RANGE.include?(peg) }
  end

  def valid_code?(input) # no duplicates
    valid_lineup?(input) && input.uniq.length == input.length
  end


end
