class Temperature
  attr_accessor :in_fahrenheit, :in_celsius

  def initialize(temperature_hash)
    @temperature_hash = {f: nil, c: nil}.merge(temperature_hash) 
    @in_celsius = (@temperature_hash[:c] ||= ftoc(@temperature_hash[:f]))
    @in_fahrenheit = (@temperature_hash[:f] ||= ctof(@temperature_hash[:c]))
  end

  def ftoc(f)
    ((f.to_i - 32) * 0.555).ceil
  end

  def ctof(c)
    (c.to_i * 1.8) + 32
  end

  def self.from_celsius(temp)
    Temperature.new({c: temp})
  end

  def self.from_fahrenheit(temp)
    Temperature.new({f: temp})
  end  
  
end

class Celsius < Temperature

  def initialize(temp)
    super({c: temp})
  end 

end

class Fahrenheit < Temperature

  def initialize(temp)
    super({f: temp})
  end 

end