require 'pry'
require 'pry-nav'

def echo(word)
  word
end

def shout(phrase)
  phrase.upcase
  
end

def repeat(word, times=2)
  ("#{word} " * times).chop
  
end

def start_of_word(word, chars)
  word[0..(chars-1)]
  
end

def first_word(phrase)
  phrase.split[0]

end

def titleize(phrase)
  little_words = ["and", "the", "over"]
  words = phrase.split
  words[0].capitalize!
  words.map! { |word| little_words.include?(word) ? word : word.capitalize }
  return_phrase = words.join(" ")
end