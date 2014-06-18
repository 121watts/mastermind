class PatternMatcher

  attr_reader :user_guess, :pattern, :output

  def initialize(user_guess, pattern)
    @user_guess = user_guess.split('')
    @pattern = pattern.split('')
    @output = {correct_content:0, correct_position:0, full_match: false}
  end

  def arrays_match?
    user_guess == pattern
  end

  def content_match
    user = user_guess.dup
    pattern.each do |element|
      if user.include?(element)
        @output[:correct_content] += 1
        index = user.find_index(element)
        user.delete_at(index)
      end
    end
  end

  def position_match
    pattern.each_with_index do |element, index|
       @output[:correct_position] += 1 if element == user_guess[index]
    end
  end
end
