require_relative('player.rb')
require_relative('feedback.rb')
require_relative('secret_code.rb')
require_relative('game.rb')
require_relative('mode.rb')



puts "Welcome to Mastermind!"

puts "Enter 1 to be the guesser of the secret code, or enter 2 to be the creator of the secret code"

case gets.chomp
when '1'
  Mode.new
when '2'
  Mode.new(:computer)
else
  puts "Invalid input"
  puts "Exiting..."
end
