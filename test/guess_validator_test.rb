gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_validator'

class GuessValidatorTest < Minitest::Test

  def test_4_letter_guess_is_correct_length
    guess = GuessValidator.new('rgby')
    assert guess.correct_length?
  end

  def test_3_letter_guess_is_incorret_length
    guess = GuessValidator.new('rgb')
    refute guess.correct_length?
  end

  def test_guess_contains_correct_characters

    guess = GuessValidator.new('GGGG') #breaks when using GGGG, and ZZZZ
    assert guess.correct_characters?

    guess = GuessValidator.new('ZZZZ')
    refute guess.correct_characters?
  end
end
