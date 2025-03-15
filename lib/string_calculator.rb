class StringCalculator
  def self.add(numbers)
    delimiter = ",|\n"

    num_list = numbers.split(/#{delimiter}/).map(&:to_i)
    
    num_list.sum
  end
end