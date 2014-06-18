gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_holder'

class GuessHolderTest<Minitest::Test
  def test_if_holder_is_empty
    guess = GuessHolder.new
    assert_equal 0, guess.turn_counter
  end

  def test_if_its_holds_guess
    guess = GuessHolder.new
    guess.add_guess("RRRR")
    assert_equal 1, guess.turn_counter
  end

  def test_it_holds_multiple_guess
    guess = GuessHolder.new
    guess.add_guess("GGGG")
    guess.add_guess("GGGG")
    assert_equal 2, guess.turn_counter
  end

  def holds_multiple_unique_tests
    guess = GuessHolder.new
    guess.add_guess("GGGG")
    guess.add_guess("RRRR")
    assert_equal ["RRRR","GGGG"], guess.user_history
  end
end
