# I DONT DO ANYTHING CAUSE I AM I GIANT WHOREBAG


# require_relative './pattern'
# require_relative './pattern_generator'
# require_relative './pattern_matcher'
#
# class Game
#
#   def initialize
#     @user_input = ""
#   end
#
#   def execute
#     until @user_input == "q"
#       puts @secret_pattern
#       print "Enter your guess: "
#       @user_input = gets.chomp.downcase
#       matcher  = PatternMatcher.new(@user_input, @secret_pattern.join)
#       matcher.content_match
#       matcher.position_match
#       content_match  = matcher.output[:correct_content]
#       position_match = matcher.output[:correct_position]
#         if content_match == position_match
#           puts "Grats You've Won the Game!"
#         else
#           puts "You have #{content_match} content matches and #{position_match} position matches"
#         end
#         return
#     end
#     puts "Thanks for playing Mastermind"
#   end
#
#   def validate
#     validate = GuessValidator.new(@user_input)
#       if validate.correct_length? == false
#         puts "please input 4 letters"
#       else
#     end
#   end
#
#
#
# end
