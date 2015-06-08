class Dictionary
  attr_reader :entries
  attr_writer :add

  def initialize
    @entries = {}
  end

  def add(key_value)
    if key_value.is_a? Hash
      key_value.each do |key, value|
        @entries[key] = value
      end
    else
      @entries[key_value] = nil
    end    
  end

  def keywords
    @entries.keys.sort
  end

  def include?(keyword)
    @entries.include?(keyword)
  end

  def find(keyword)
    selected = @entries.keys.grep(/^(#{keyword})/)
    @entries.keep_if { |key, value| selected.include?(key) }
  end

  def printable
    output = ""  
      @entries.sort.each do |key, value|
        output += "[#{key}] \"#{value}\"\n"
      end
    output.chop
  end

end