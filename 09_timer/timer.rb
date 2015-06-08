class Timer
  attr_reader :time_string, :seconds

  def initialize
    @seconds = 0
  end

  def seconds=(seconds = @seconds)
    hours = padded((seconds/60/60))
    minutes = padded((seconds/60%60))
    seconds = padded((seconds%60))
    @time_string = "#{hours}:#{minutes}:#{seconds}"
  end

  # private
    def padded(num)
      if num < 10
        num = "0#{num}"
      else
        num.to_s
      end
    end


  
end