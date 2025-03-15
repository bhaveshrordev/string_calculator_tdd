class NegativeNumberError < StandardError
  def initialize(negatives)
    super("Negative numbers not allowed: #{negatives.join(', ')}")
  end
end
