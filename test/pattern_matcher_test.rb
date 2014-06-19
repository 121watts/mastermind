gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/pattern_matcher'

class PatternMatcherTest<Minitest::Test

  def test_if_patterns_are_strings
    matcher = PatternMatcher.new("RRRR", "GGGG")
    assert_equal matcher.user_guess.class, matcher.pattern.class
  end

  def test_pattern_array_match
    matcher = PatternMatcher.new("RRRR","RRRR")
    assert matcher.arrays_match?
  end

  def test_patterns_dont_match
    matcher = PatternMatcher.new("RRRR","GGGG")
    refute matcher.arrays_match?
  end

  def test_pattern_match_number
    matcher = PatternMatcher.new("zzzz", "qqqq")
    matcher.content_match
    assert_equal 0, matcher.output[:correct_content]
  end

  def test_pattern_matches_different_number_of_matches
    matcher = PatternMatcher.new("RRRY","GRRR")
    matcher.content_match
    assert_equal 3, matcher.output[:correct_content]
  end

  def test_position_match_correct_number
    matcher = PatternMatcher.new("ggrg","yyry")
    matcher.position_match
    assert_equal 1, matcher.output[:correct_position]
  end

  def test_counter
    matcher = PatternMatcher.new("ggrg", %w(r y g y))
    matcher.position_match
    assert_equal 1, matcher.turn_counter
  end

end
