def ftoc(fahrenheit)
  ((fahrenheit.to_i - 32) * 0.555).ceil
end

def ctof(celsius)
  (celsius.to_i * 1.8) + 32
end