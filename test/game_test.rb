gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_game_starts_with_zero_turns
    game = Game.new
    assert 0, game.turns
  end

  def test_track_user_history
    skip
    game = Game.new
    game.add_guess('RRGB')

    assert_equal ['RRGB'], game.game_history
  end

  def test_the_player_wins_on_the_first_turn
    skip
    game = Game.new
    pattern_code = game.pattern.code
  end

  def test_the_player_wins_using_wrong_case

  end

  def test_the_player_wins_on_second_turn

  end

end
