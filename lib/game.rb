require_relative './pattern'

class Game

  attr_accessor :patterns

  def initialize
    @patterns = []
  end

  def empty?
    if @patterns[0] == nil
      true
    else
      false
    end
  end

  def count
    @patterns.count
  end

  def <<(letters)
    @patterns << letters
  end

end
