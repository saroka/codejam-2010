require 'spec_helper'

describe RollerCoaster do
  describe 'reading input from file' do
    it 'should build testcases from file' do
      s = RollerCoaster.new('spec/rollertestcase.in')
      s.testcases.should have(3).items
      s.testcases[0].rides.should == 4
      s.testcases[0].capacity.should == 6
      s.testcases[0].groups.should have(4).groups
      s.testcases[0].groups[0].should == 1
      s.testcases[0].groups[1].should == 4
      s.testcases[0].groups[2].should == 2
      s.testcases[0].groups[3].should == 1
    end
  end

  describe 'solve' do
    let(:roller) { RollerCoaster.new('spec/rollertestcase.in') }

    it 'should solve for rides = 4, capacity = 6, groups = [1, 4, 2, 1]' do
      roller.solve(4,6,[1,4,2,1]).should == 21
    end
    
    it 'should solve for rides = 100, capacity = 10, groups = [1]' do
      roller.solve(100,10,[1]).should == 100
    end
    
    it 'should solve for rides = 5, capacity = 5, groups = [2,4,2,3,4,2,1,2,1,3]' do
      roller.solve(5,5,[2,4,2,3,4,2,1,2,1,3]).should == 20
    end
  end

  describe 'output' do
    let(:roller) { RollerCoaster.new('spec/rollertestcase.in') }

    it 'should output correctly' do
      roller.output.should == "Case #1: 21\nCase #2: 100\nCase #3: 20"
    end
  end
end