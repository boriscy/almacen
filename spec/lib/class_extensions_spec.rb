require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Array, "unique_values" do
  before do
    @arr = [1,2,3,2,1]
  end

  it "should return Unique values" do
    @arr.unique_values.should == [1,2,3]
  end

end
