module SecretCode
  extend self

  NUMBER_OF_PEGS = 4
  PEG_RANGE = (1..6)

  def generate_code
    PEG_RANGE.to_a.sample(NUMBER_OF_PEGS)
  end

  def valid_lineup?(input)
    input.length == NUMBER_OF_PEGS && input.all? { |peg| PEG_RANGE.include?(peg) }
  end

  def valid_code?(input) # no duplicates
    valid_lineup?(input) && input.uniq.length == input.length
  end


end
