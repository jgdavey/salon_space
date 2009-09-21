require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HowMet do
  before(:each) do
    @valid_attributes = {
      :name => 'Library'
    }
  end

  it "should create a new instance given valid attributes" do
    HowMet.create!(@valid_attributes).should be_a(HowMet)
  end
end
