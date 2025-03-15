# String Calculator TDD Kata

## 📌 Overview
This is a **String Calculator** implemented in Ruby using **Test-Driven Development (TDD)**. The calculator takes a string of numbers, separated by commas or new lines, and returns their sum. It also supports custom delimiters and handles errors for negative numbers.

---

## 🚀 Features
- Returns the sum of numbers in a given string.
- Supports **comma (`,`)** and **new line (`\n`)** as delimiters.
- Allows **custom delimiters** specified at the beginning of the string.
- Throws an exception for **negative numbers** with a descriptive error message.
- Fully tested using **RSpec** following TDD principles.

---

## 📂 Project Structure
```
string_calculator_tdd/
│── lib/
│   ├── string_calculator.rb  # Main String Calculator Logic
│   ├── negative_number_error.rb  # Custom Error Handling
│── spec/
│   ├── string_calculator_spec.rb  # RSpec Test Cases
│── README.md  # Project Documentation
│── Gemfile  # Dependencies
│── .rspec  # RSpec Config
```

---

## 🛠️ Installation & Setup
### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/yourusername/string_calculator_tdd.git
cd string_calculator_tdd
```

### **2️⃣ Install Dependencies**
Make sure you have **Ruby** and **Bundler** installed. Then run:
```sh
bundle install
```

---

## ⚡ Usage
Run the calculator in an **interactive Ruby console (IRB/Pry)**:
```ruby
require_relative 'lib/string_calculator'

puts StringCalculator.add("1,2,3")  # Output: 6
puts StringCalculator.add("//;\n1;2")  # Output: 3
```

### **Handling Negative Numbers**
```ruby
begin
  StringCalculator.add("1,-2,3,-4")
rescue NegativeNumberError => e
  puts "Error: #{e.message}"
end
```
**Output:**
```
Error: Negative numbers not allowed: -2, -4
```

---

## ✅ Running Tests
Run **RSpec** to ensure all test cases pass:
```sh
rspec
```
Expected output:
```
....
All tests passed!
```

---
