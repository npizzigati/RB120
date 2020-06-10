# Number Guesser Part 1
# Create an object-oriented number guessing class for numbers in the
# range 1 to 100, with a limit of 7 guesses per game. The game should
# play like this:

class GuessingGame
  def initialize()
    @number = rand(1..100)
    @attempt = 1
  end

  def play
    while @attempt <= 7
      puts "You have #{8 - @attempt} guesses remaining."
      input = retrieve_user_input
      if input < @number
        puts "Your guess is too low."
      elsif input > @number
        puts "Your guess is too high"
      else
        puts "That's the number.\n\n" \
             "You won!"
        break
      end
      @attempt += 1
    end
  end

  def retrieve_user_input
    converted_response = nil
    loop do
      print "Enter a number between 1 and 100: "
      response = gets.chomp
      converted_response = response.to_i
      break if /\d{1,3}/.match?(response) &&
               (1..100).include?(converted_response)
      print "Invalid guess. "
    end
    converted_response
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
# Note that a game object should start a new game with a new number to
# guess with each call to #play.
