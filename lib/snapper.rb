class Snapper

  attr_reader :testcases

  def initialize(file_name)
    File.open(file_name) do |f|
      @testcases = []
      while line = f.gets do
        line_a = line.split(' ').map { |i| i.to_i }
        if line_a.size > 1
          @testcases << line_a
        else
          @testcases_size = line_a.first
        end
      end
    end
    raise 'InvalidInput' unless @testcases.size == @testcases_size
  end
  
  def solve
    result = ''
    testcases.each_with_index { |t, index| result += "#{solve_testcase(t, index)}\n"}
    result.chomp
  end
  
  def solve_testcase(t, index)
    "Case ##{index+1}: #{light(t[0],t[1]) ? 'ON' : 'OFF'}"
  end
  
  def light(i,j)
    if i == 1
      j % 2 != 0
    else
      j > 0 ? power(i,j) && state(i,j) : false
    end
  end

  def state(i,j)
    j > 0 ? power(i,j-1) ^ state(i,j-1) : false
  end

  def power(i,j)
    i > 1 ? light(i-1,j) : true
  end
end