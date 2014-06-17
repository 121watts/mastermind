class PatternGenerator
  attr_reader :options, :random_pattern

  def initialize
    @options = ['R','G','Y','B']
    @random_pattern = []
  end

  def generate
    @options.length.times do
      index = rand(@options.length)
      @random_pattern << @options[index]
    end
  end
end

# pattern = PatternGenerator.new
# pattern.generate
# pattern.random_pattern

  # This used to look like this:
  #
  # all_letters =  [('R'),('G'),('Y'),('B'),('R'),('G'),('Y'),('B'),('R'),('G'),('Y'),
  #   ('B'),('R'),('G'),('Y'),('B'),('R'),('G'),('Y'),('B'),]
  #
  # random_array = all_letters.shuffle
  # random_four_pattern = random_array.pop(4)
  #
  # puts random_four_pattern
  # puts random_four_pattern.class
