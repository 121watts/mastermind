require './lib/pattern_generator'
require './lib/pattern_matcher'
require './lib/guess_validator'
require './lib/game.rb'
require 'term/ansicolor'

class String
  include Term::ANSIColor
end



class CLI
  attr_reader :user_input, :secret_pattern, :turns, :total_turns, :time

  def initialize
    @user_input = ''
    @secret_pattern = PatternGenerator.new('rygb').generate
    @turns = 0
    @turns_left = 14
    @time = Time.new
  end


  def start
    puts %q{
 __   __  _______  _______  _______  _______  ______    __   __  ___   __    _  ______
|  |_|  ||   _   ||       ||       ||       ||    _ |  |  |_|  ||   | |  |  | ||      |
|       ||  |_|  ||  _____||_     _||    ___||   | ||  |       ||   | |   |_| ||  _    |
|       ||       || |_____   |   |  |   |___ |   |_||_ |       ||   | |       || | |   |
|       ||       ||_____  |  |   |  |    ___||    __  ||       ||   | |  _    || |_|   |
| ||_|| ||   _   | _____| |  |   |  |   |___ |   |  | || ||_|| ||   | | | |   ||       |
|_|   |_||__| |__||_______|  |___|  |_______||___|  |_||_|   |_||___| |_|  |__||______|
    }.yellow

    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "enter command ~> "
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
      instructions
    end
  end

  def instructions
    instructions_text
    user_input = gets.strip.downcase
    case user_input
    when 'q'
      puts 'Later Biatch!'
    when 'p'
      execute
    else
      puts "Sorry, I don't know how to (#{user_input})"
      instructions
    end
  end

  def instructions_text
    puts "I have generated a beginner sequence with four elements made up of: #{'(r)ed'.red},"
    puts "#{'(g)reen'.green}, #{'(b)lue'.blue}, and #{'(y)ellow'.yellow}. Use (q)uit at any time to end the game."
    print "Let's (p)lay:"
  end

  def execute
    until (user_input == "q") || (@position_match == 4)
      print "enter your guess ~> "
      @user_input = gets.chomp.downcase
      validator = GuessValidator.new(@user_input)
      @turns += 1
      @turns_left -= 1
        if validator.correct_length? == false || validator.correct_letters? == false
          puts 'Your guess must be a length of FOUR and'
          puts "be of these colors #{'(r)ed'.red}, #{'(y)ellow'.yellow}, #{'(g)reen'.green}, #{'(b)lue'.blue}"
        else
          matcher = PatternMatcher.new(@user_input, @secret_pattern)
          matcher.content_match
          matcher.position_match
          @content_match  = matcher.output[:correct_content]
          @position_match = matcher.output[:correct_position]
          puts "You have #{@content_match} content matches and #{@position_match} position matches"
          puts "You have taken #{@turns} turn(s)"
          puts "#{@turns_left} turn(s) left!"
          if @position_match == 4
          timer
          end
          if @turns_left == 0
            puts "You LOOOOOOSE Muahahahah!"
          end
        end
      end
    puts "Thanks for playing MASTERmind"
  end

  def timer
    minutes = Time.now.min - @time.min
    seconds = Time.now.sec - @time.sec
    puts "You won in #{minutes.abs} min and #{seconds.abs} secs!"
  end



end



CLI.new.start
