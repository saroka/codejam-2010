require 'spec_helper'

describe FairWarning do
  describe 'reading input from file' do
    it 'should build testcases from file' do
      s = FairWarning.new('spec/fairtestcase.in')
      s.testcases.should have(3).items
      s.testcases[0].should == [26000000, 11000000, 6000000]
      s.testcases[1].should == [1, 10, 11]
      s.testcases[2].should == [800000000000000000001, 900000000000000000001]
    end
  end
  
  describe 'solving' do
    let(:fair) { FairWarning.new('spec/fairtestcase.in') }
    it 'should return 0 when t = [1, 10, 11]' do
      fair.solve([1, 10, 11]).should == 0
    end
    it 'should return 4000000 when t = [26000000, 11000000, 6000000]' do
      fair.solve([26000000, 11000000, 6000000]).should == 4000000
    end
  end
end