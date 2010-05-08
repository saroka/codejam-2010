require 'spec_helper'

describe Snapper do
  describe 'reading input from file' do
    it 'should build testcases from file and change n to n-1 (zero-based)' do
      s = Snapper.new('spec/testcase.in')
      s.testcases.should have(4).items
      s.testcases[0].should == [1,0]
      s.testcases[1].should == [1,1]
      s.testcases[2].should == [4,0]
      s.testcases[3].should == [4,47]
    end

    it 'should raise InvalidInput when number of testcases are incorrect' do
      lambda { Snapper.new('spec/testcase_invalid.in') }.should raise_error('InvalidInput')
    end
  end

  describe 'calculating snapper chain' do
    let(:snapper) { Snapper.new('spec/testcase.in') }

    [[1,0,false], [1,1,true], [4,0,false], [4,47,true], [2,3,true]].each do |n, k, expected|
      it "should return the final state of the chain for n = #{n} and k = #{k}" do
        snapper.light(n,k).should == expected
      end
    end
  end

  describe 'calculating snapper chain for all testcases' do
    let(:snapper) { Snapper.new('spec/testcase.in') }

    it 'should return a string containing results'  do
      snapper.solve.should == "Case #1: OFF\nCase #2: ON\nCase #3: OFF\nCase #4: ON"
    end
  end
end