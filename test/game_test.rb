gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_to_see_if_game_starts_with_no_pattern
    assert Game.new.empty?
  end

  def test_count_number_of_patterns
    assert_equal 0, Game.new.count
  end

  def test_if_empty_game_has_no_patterns
    assert_equal [], Game.new.patterns
  end

  def test_pattern_gets_put_in_game
    game = Game.new
    pattern = Pattern.new("GGGG")
    game << pattern
    assert_equal [pattern], game.patterns
  end

  def test_pattern_put_in_game_game_no_longer_empty
    game = Game.new
    game << Pattern.new("GGGG")
    refute game.empty?
  end

  def test_game_counts_candies
    game = Game.new
    game << Pattern.new("GGGG")
    assert_equal 1, game.count
  end
  
end
