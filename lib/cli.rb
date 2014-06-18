require './lib/pattern_generator'
require './lib/pattern_matcher'
require './lib/guess_validator'
require './lib/game.rb'

class CLI
  attr_reader :user_input

  def initialize
    @user_input = ''
    # PatternGenerator.new('rgby')
  end

  def start
    puts "Welcome to MASTERmind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "Enter your command:"
    user_input = gets.strip.downcase
    case user_input
      when 'q'
        puts 'Later biatch!'
      when 'i'
        instructions
      when 'p'
        execute
    end
  end

  def instructions
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
    puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    print "Let's (p)lay:"
    user_input = gets.strip.downcase
    case user_input
    when 'q'
      puts 'Later biatch'
    when 'p'
      execute
    end
  end

  def execute
    until user_input == "q"
      print "Enter your guess: "
      @user_input = gets.chomp
      validator = GuessValidator.new(@user_input)
        if validator.correct_length? == false || validator.correct_letters? == false
          puts 'Your guess must be a length of FOUR and'
          puts 'be of these colors (r)ed, (y)ellow, (g)reen, (b)lue'
        elsif
          @secret_pattern = PatternGenerator.new(%w(r y g b)).generate
          puts @secret_pattern
          matcher   = PatternMatcher.new(@user_input, @secret_pattern.join)
          matcher.content_match
          matcher.position_match
          content_match  = matcher.output[:correct_content]
          position_match = matcher.output[:correct_position]
          puts "You have #{content_match} content matches and #{position_match} position matches"
        end
    end
    puts "Thanks for playing Mastermind"
  end
end


CLI.new.start
