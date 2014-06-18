gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/pattern_generator'

class PatternGeneratorTest<Minitest::Test

  def test_if_patterns_are_not_equal
    pattern = PatternGenerator.new
    code = pattern.generate
    code2 = pattern.generate
    refute code == code2 
  end

end
