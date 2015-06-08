def measure(num=1)
  run_times = []
  num.times do |i|
    before = Time.now
    yield 
    after = Time.now
    run_times << after - before
  end
  run_times.reduce(:+) / run_times.size
  
end

