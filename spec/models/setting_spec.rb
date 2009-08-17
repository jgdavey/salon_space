require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Setting do
  it "should create a new instance given valid attributes" do
    Factory(:setting).should_not be_nil
  end
end

describe Setting, "booleans" do
  it "should recognize a true value" do
    setting = Factory(:setting, :name => 'signup_enabled', :value => 'true')
    Setting[:signup_enabled].should be_true
  end
  
  it "should recognize a false value" do
    setting = Factory(:setting, :name => 'signup_enabled', :value => 'false')
    Setting[:signup_enabled].should be_false
  end
end
