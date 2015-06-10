require 'pry'

module InWords

  WORDS = { 
    "0" => "zero", 
    "1" => "one", 
    "2" => "two",
    "3" => "three",
    "4" => "four",
    "5" => "five",
    "6" => "six",
    "7" => "seven",
    "8" => "eight",
    "9" => "nine",
    "10" => "ten",
    "11" => "eleven",
    "12" => "twelve",
    "13" => "thirteen",
    "14" => "fourteen",
    "15" => "fifteen",
    "16" => "sixteen",
    "17" => "seventeen",
    "18" => "eighteen",
    "19" => "nineteen",
    "20" => "twenty",
    "30" => "thirty",
    "40" => "forty",
    "50" => "fifty",
    "60" => "sixty",
    "70" => "seventy",
    "80" => "eighty",
    "90" => "ninety",
    "100" => "hundred",
    "1000" => "thousand",
    "1000000" => "million",
    "1000000000" => "billion",
    "1000000000000" => "trillion"
  }

  def in_words
    @@word_string = ""
    remaining_digits = self
    if remaining_digits == 0
      WORDS["0"]
    else
      while remaining_digits > 0
        if remaining_digits >= 1_000_000_000_000
          remaining_digits = and_beyond(remaining_digits, "trillion")
        elsif remaining_digits >= 1_000_000_000
          remaining_digits = and_beyond(remaining_digits, "billion")
        elsif remaining_digits >= 1_000_000
          remaining_digits = and_beyond(remaining_digits, "million")
        elsif remaining_digits >= 1000
          remaining_digits = and_beyond(remaining_digits, "thousand")
        elsif remaining_digits >= 100
          remaining_digits = hundreds(remaining_digits)
        elsif remaining_digits >= 10
          remaining_digits = tens(remaining_digits)
        elsif remaining_digits < 10
          remaining_digits = singles(remaining_digits)
        end          
      end
      @@word_string
    end
  end

  def and_beyond(num, suffix)
    remaining_digits = num.to_s
    if num < (WORDS.key(suffix).to_i * 10)
      first_digit = remaining_digits.slice!(0)
      @@word_string += " " unless @@word_string.empty?
      @@word_string += WORDS["#{first_digit}"]
      @@word_string += " #{suffix}"
    elsif num < (WORDS.key(suffix).to_i * 20)
      first_digits = remaining_digits.slice!(0..1)
      @@word_string += " " unless @@word_string.empty?
      @@word_string += WORDS["#{first_digits}"]
      @@word_string += " #{suffix}"
    elsif num < (WORDS.key(suffix).to_i * 100)
      first_digit = remaining_digits.slice!(0)
      @@word_string += " " unless @@word_string.empty?
      @@word_string += WORDS["#{first_digit}0"]
      @@word_string += " #{suffix}" if remaining_digits.to_s[0] == "0"
    else
      first_digit = remaining_digits.slice!(0)
      hundreds((first_digit * 100))
    end
    remaining_digits.to_i
  end

  def hundreds(num)
    remaining_digits = num.to_s
    first_digit = remaining_digits.slice!(0)
    @@word_string += " " unless @@word_string.empty?
    @@word_string += WORDS["#{first_digit}"]
    @@word_string += " hundred"
    remaining_digits.to_i
  end

  def tens(num)
    if num < 20
      @@word_string += " " unless @@word_string.empty?
      @@word_string += WORDS["#{num}"]
      return 0
    else 
      remaining_digits = num.to_s
      first_digit = remaining_digits.slice!(0)
      @@word_string += " " unless @@word_string.empty?
      @@word_string += WORDS["#{first_digit}0"]
      remaining_digits.to_i
    end
  end

  def singles(num)
    @@word_string += " " unless @@word_string.empty?
    @@word_string += WORDS["#{num}"]
    return 0    
  end
  
end

class Fixnum
  include  InWords
end
