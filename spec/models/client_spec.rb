require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  it "should create a new instance given valid attributes" do
    Factory(:client).should be_valid
  end
  
  it "should create a new name" do
    c = Factory(:client, :name => 'Jim Bob')
    c.first_name.should eql('Jim')
    c.last_name.should eql('Bob')
    c.name.should eql('Jim Bob')
  end
  
  it "should be valid with phone format of ###-###-####" do
    client = Factory.build(:client, :phone => '987-654-1234')
    client.should be_valid
  end
  
  it "should not be valid without phone format of ###-###-####" do
    client = Factory.build(:client, :phone => '1234')
    client.should_not be_valid
  end
end
