class GuessHolder

  attr_reader :user_history

  def initialize
    @user_history = []
    pattern_generator = PatternGenerator.new(4, %W(r g b y))
  end

  def add_guess(user_guess)
    user_history << user_guess
  end

  def turn_counter
    @user_history.count
  end

end
