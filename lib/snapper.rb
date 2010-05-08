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
  
  def partial_testcase_solve(opts = {})
    testcase = testcases[opts[:testcase]]
    i = opts[:snapper]
    j = opts[:snap_finger]
    if j == 0
      :off
    end 
  end
  
end