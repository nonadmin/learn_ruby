def add(num1,num2)
  num1 + num2
  
end

def subtract(num1, num2)
  num1 - num2
end

def sum(array)
  array.empty? ? 0 : array.reduce(:+)
end

def multiply(array)
  array.reduce(:*)
  
end

def power(num1, num2)
  num1 ** num2
  
end

def factorial(num)
  (num).downto(1).reduce(1, :*)
  
end