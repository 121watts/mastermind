gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/pattern_generator'

class PatternGeneratorTest<Minitest::Test

  def test_if_pattern_is_generated
    pattern = Pattern.new
    assert_equal [@random_pattern], pattern.generate
  end

end
