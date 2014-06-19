require './lib/pattern_generator'
require './lib/pattern_matcher'
require './lib/guess_validator'
require './lib/game.rb'

class CLI
  attr_reader :user_input, :secret_pattern

  def initialize
    @user_input = ''
    @secret_pattern = PatternGenerator.new('rygb').generate
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
      else
      puts "Sorry, I don't know how to (#{user_input})"
      CLI.new.start
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
    else
      puts "Sorry, I don't know how to (#{user_input})"
      CLI.new.start
    end
  end

  def execute
    until (user_input == "q") || (@content_match == 4 && @position_match == 4)
      print "Enter your guess: "
      @user_input = gets.chomp
      validator = GuessValidator.new(@user_input)
        if validator.correct_length? == false || validator.correct_letters? == false
          puts 'Your guess must be a length of FOUR and'
          puts 'be of these colors (r)ed, (y)ellow, (g)reen, (b)lue'
        else
          puts @secret_pattern
          matcher = PatternMatcher.new(@user_input, @secret_pattern)
          matcher.content_match
          matcher.position_match
          @content_match  = matcher.output[:correct_content]
          @position_match = matcher.output[:correct_position]
          puts "You have #{@content_match} content matches and #{@position_match} position matches"
          if @content_match == 4 && @position_match == 4
            puts "you win"
          end
        end
    end
    puts "Thanks for playing MASTERmind"
  end
end


CLI.new.start
