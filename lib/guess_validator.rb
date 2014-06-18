class GuessValidator

  attr_reader :guess

  def initialize(user_guess)
    @user_guess = user_guess
  end

  def correct_length?
    @user_guess.length == 4 ? true : false
  end

  def correct_letters?
    input = @user_guess.split('')
    valid = %w(r b g y)

    invalid_chars = input - (input & valid)
    invalid_chars.empty?
  end

end
