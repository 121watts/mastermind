require_relative './pattern'

class PatternGenerator
  attr_reader :random_pattern

  def initialize(letters)
    @letters = letters
    @random_pattern = []
  end

  def generate
    @random_pattern = @letters.shuffle
  end
end
