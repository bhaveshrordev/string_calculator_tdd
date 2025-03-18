require_relative 'negative_number_error'

class StringCalculator
  ALLOWED_EXPRESSION = /\A[\d\s+\-\+\*\/()]+\z/

  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"

    # Check for custom delimiter
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts.first[2..]) # Extract custom delimiter
      numbers = parts.last
    end

    match = numbers.match(%r{//(.+)\n(.*)})

    if match
      delimiter = Regexp.escape(match[1])
      numbers = match[2]
    else
      numbers = numbers
    end

    expression = numbers.gsub(Regexp.union(delimiter.split('|')), '+')

    num_list = numbers.split(/#{delimiter}/).map(&:to_i)

    # Handle negative numbers
    negatives = num_list.select(&:negative?)
    raise NegativeNumberError.new(negatives) unless negatives.empty?

    result = save_eval(expression)
  end


  def self.save_eval(expression)
    raise SecurityError, "Invalid characters detected in expression" unless expression.match?(ALLOWED_EXPRESSION)

    eval(expression) # Safe execution since only allowed characters are present
  end
end
