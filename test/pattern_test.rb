gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class PatternTest < Minitest::Test

  def test_if_pattern_holds_letters
    pattern = Pattern.new("GGGG")
    assert_equal "GGGG", pattern.letters
  end

  def test_if_pattern_holds_different_letters
    pattern = Pattern.new("FGYH")
    assert_equal "FGYH", pattern.letters
  end

end
