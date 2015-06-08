class Array

  def sum
    self.reduce(0) { |total,i| total + i }
  end

  def square
    self.map { |i| i ** 2}    
  end

  def square!
    self.map! { |i| i ** 2 }
    
  end

end