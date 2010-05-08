require 'ostruct'

class RollerCoaster
  attr_reader :testcases
  def initialize(file_name)
    File.open(file_name) do |f|
      @testcases = []
      while line = f.gets do
        line_a = line.split(' ').map { |i| i.to_i }
        if line_a.size > 1
          os = OpenStruct.new({:rides => line_a[0], :capacity => line_a[1]})
          os.groups = f.gets.split(' ').map { |i| i.to_i }
          @testcases << os
        end
      end
    end
  end
  
  def solve(rides, capacity, groups)
    euros = 0
    rides.times do
      capacity_index = groups.size
      capacity_filled = 0
      onboard_groups = []
      offboard_groups = []
      groups.each do |g|
        capacity_index -= 1
        unless capacity_filled + g > capacity
          capacity_filled += g
          onboard_groups << g
          offboard_groups = groups.last(capacity_index)
          euros += g
        else
          break
        end
      end
      groups = offboard_groups + onboard_groups
    end
    euros
  end

  def output
    result = ''
    testcases.each_with_index do |t, index| 
      result += "Case ##{index+1}: #{solve(t.rides,t.capacity,t.groups)}\n"
    end
    result.chomp
  end
  
end