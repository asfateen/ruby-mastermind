class Feedback
  attr_reader :correct_position, :wrong_position

  def initialize(correct_position, wrong_position)
    @correct_position = correct_position
    @wrong_position = wrong_position
  end

  def to_s
    "#{correct_position} correct positions, #{wrong_position} incorrect positions"
  end
end