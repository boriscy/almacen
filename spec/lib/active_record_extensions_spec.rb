require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActiveRecord::Base do

  before(:each) do
    @names = ["Juan", "Pedro", "Maria Luna"]
    @names.each do |name|
      TestModel.create!(:name => name)
    end
  end

  it "should have the method to_s with the name" do
    m = TestModel.first
    m.name.should == m.to_s
  end

  it "should show a list" do
    TestModel.list.size.should == 3
    i = 1
    TestModel.list.should == @names.inject([]){|arr, v| arr << [v, i]; i +=1; arr}
  end
end
