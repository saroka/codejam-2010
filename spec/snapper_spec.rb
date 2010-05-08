require 'spec_helper'

describe Snapper do
  describe 'reading input from file' do
    it 'should build testcases from file' do
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
    it 'should return the initial state of the chain as :off' do
      snapper.testcases.size.times do |t|
        snapper.testcases[t].first.times do |i|
          light_state = snapper.partial_testcase_solve({:testcase => t, :snapper => i, :snap_finger => 0})
          light_state.should == :off
        end
      end
    end
    
    it 'should return the final state of the chain for testcase 0' do
      snapper.testcase_solve(:testcase => 0).should == :off
    end
    
    it 'should return the final state of the chain for testcase 1' do
      snapper.testcase_solve(:testcase => 0).should == :on
    end
    
    it 'should return the final state of the chain for testcase 2' do
      snapper.testcase_solve(:testcase => 0).should == :off
    end
    
    it 'should return the final state of the chain for testcase 3' do
      snapper.testcase_solve(:testcase => 0).should == :on
    end
  end
end