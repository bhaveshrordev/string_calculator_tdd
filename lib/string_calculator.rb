class StringCalculator
  def self.add(numbers)
    delimiter = ",|\n"

    # Check for custom delimiter
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts.first[2..]) # Extract custom delimiter
      numbers = parts.last
    end

    num_list = numbers.split(/#{delimiter}/).map(&:to_i)
    
    num_list.sum
  end
end