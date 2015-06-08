require 'pry'

class RPNCalculator
  attr_reader :value

  def initialize
    @stack = []    
  end

  def push(num)
    @stack << num
  end

  def plus
    if @stack.empty?
      raise "calculator is empty"
    else
      @stack << :+
    end
  end

  def minus
    if @stack.empty?
      raise "calculator is empty"
    else
      @stack << :-
    end
  end

  def divide
    if @stack.empty?
      raise "calculator is empty"
    else
      @stack << :/
    end
  end

  def times
    if @stack.empty?
      raise "calculator is empty"
    else
      @stack << :*
    end
  end

  def tokens(string)
    token_array = string.split

    token_array.map do |v|
      operators = ["+", "-", "*", "/"]
      if operators.include?(v)
        v.to_sym
      else
        v.to_i
      end
    end
    
  end

  def value
    while @stack.size >= 3
      @stack.each_with_index do |v,i|
        break if @stack.size <=2
        next unless v.is_a?(Symbol)
        new_value = eval("#{ @stack[(i-2)] } #{v.to_s} #{ @stack[(i-1)] }.to_f")
        @stack.delete_at(i)
        @stack.slice!( (i-2)..(i-1) )
        @stack = @stack.unshift(new_value)      
      end
    end

    @stack[0]
  end

end

# def temp
#   stack = [1,2,3,"*","+"]
#   while stack.size >= 3
#     print stack
#     print "\n"
#     stack.each_with_index do |v,i|
#       break if stack.size <= 2
#       next unless v.is_a?(String)
#       new_value = eval("#{ stack[(i-2)] } #{v} #{ stack[(i-1)] }.to_f")
#       stack.delete_at(i)
#       stack.slice!( (i-2)..(i-1) )
#       stack = stack.unshift(new_value)      
#     end
#   end

#   print stack
  
# end

# temp