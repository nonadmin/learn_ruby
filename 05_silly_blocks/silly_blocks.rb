def reverser
  result = yield.split(" ")
  result.map! { |word| word.reverse }.join(" ")
end

def adder(num=1)
  yield + num
end

def repeater(num_of_repeats=1)
  num_of_repeats.times do 
    yield
  end
end