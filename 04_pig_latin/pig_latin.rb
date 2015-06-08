require 'pry'

def translate(phrase)
  result = []
  phrase = phrase.split(" ")
  phrase.each do |word|
    begins_consonant = word.slice!(/^[^aeiou]*/)
    if begins_consonant.empty?
      result << (word + "ay")
    else
      if begins_consonant[-1] == "q"
        word[0] = ''
        result << word + begins_consonant + "uay"
      else
        result << word + begins_consonant + "ay"
      end
    end
        
  end

  result.join(" ")
end