class FairWarning
  attr_reader :testcases
  def initialize(file_name)
    File.open(file_name) do |f|
      @testcases = []
      while line = f.gets do
        line_a = line.split(' ').map { |i| i.to_i }
        if line_a.size > 1
          @testcases << line_a.last(line_a.size-1)
        end
      end
    end
  end
  
  def solve(great_events)
    great_events.sort!
    result = 0
    1.upto(4294967296) do |i|
      if i > great_events.first
        break
      end
      0.upto(great_events.size-2) do |index|
        if great_events[index+1] + i % great_events[index] + i == 0
          result = i
        else
          result = 0
          break
        end
      end
    end
    result
  end
end