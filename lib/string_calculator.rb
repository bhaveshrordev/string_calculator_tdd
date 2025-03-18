require_relative 'negative_number_error'

class StringCalculator
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

    result = eval(expression)
  end
end
