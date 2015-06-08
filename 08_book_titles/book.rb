require 'pry'

class Book
  attr_reader :title

  def title=(title)
    articles = ["the", "a", "an", "and", "in", "of"]
    @title = title.split(" ").map do |word|
      if articles.include?(word)
        word
      else
        word.capitalize
      end
    end
    @title = @title.join(" ")
    @title[0] = @title[0].capitalize
  end

end