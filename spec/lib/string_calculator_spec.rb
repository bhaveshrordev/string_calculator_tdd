require 'rspec'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself for a single input" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "allows new lines as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "supports custom delimiters" do
      expect(StringCalculator.add("2*3,1")).to eq(7)
    end

    it "raises a NegativeNumberError for negative numbers" do
      expect { StringCalculator.add("1,-2,3,-4") }
        .to raise_error(NegativeNumberError, "Negative numbers not allowed: -2, -4")
    end
  end
end