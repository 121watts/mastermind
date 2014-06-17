gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/pattern_generator'

class PatternGeneratorTest<Minitest::Test

  def test_if_pattern_is_generated
    pattern = PatternGenerator.new
    code = pattern.generate
    assert_equal [random_pattern],  code.radom_pattern
  end

end
