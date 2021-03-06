# == Schema Information
# Schema version: 20090809024922
#
# Table name: clients
#
#  id               :integer         not null, primary key
#  first_name       :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  phone            :string(255)
#  phone_type       :string(255)
#  email            :string(255)
#  address          :string(255)
#  last_name        :string(255)
#  notes            :text
#  birthdate        :date
#  hair_description :text
#

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
  
  it "should allow spaces in last name" do
    c = Factory(:client, :name => 'Jim Bob Brown')
    c.first_name.should eql('Jim')
    c.last_name.should eql('Bob Brown')
    c.name.should eql('Jim Bob Brown')
  end
end

describe Client, "phone number" do
  it "should be valid with phone format of ###-###-####" do
    client = Factory.build(:client, :phone => '987-654-1234')
    client.should be_valid
  end
  
  it "should not be valid without phone format of ###-###-####" do
    client = Factory.build(:client, :phone => '1234')
    client.should_not be_valid
  end
  
  it "should be valid with no phone number" do
    client = Factory.build(:client, :phone => nil)
    client.should be_valid
  end
end

describe Client, "email" do
  it "should be valid with standard email format" do
    client = Factory.build(:client, :email => 'correct@example.com')
    client.should be_valid
  end
  
  it "should not be valid with a bad email address" do
    client = Factory.build(:client, :email => 'incorrect')
    client.should_not be_valid
  end
  
  it "should allow blank email" do
    client = Factory.build(:client, :email => '')
    client.should be_valid
  end
end

describe Client, "address" do
  it "should be an address" do
    client = Factory.build(:client, :address => "123 W Point\nChicago, IL")
    client.address.should eql("123 W Point\nChicago, IL")
  end
end

describe Client, "other attributes" do
  it "should have a notes field" do
    client = Factory.build(:client)
    client.notes = "Blah blah."
    client.should be_valid
  end
  
  it "should have a hair description field" do
    client = Factory.build(:client)
    client.hair_description = "Long and hideous"
    client.should be_valid
  end
end

describe Client, "::find_or_create_by_name" do
  it "should find existing clients" do
    existing_client = Factory(:client, :name => "Jimmy Dean")
    Client.find_or_create_by_name("Jimmy Dean").should == existing_client
  end
  
  it "should find existing clients (2)" do
    existing_client = Factory(:client, :name => "Jimmy Dean Davey")
    Client.find_or_create_by_name("Jimmy Dean Davey").should == existing_client
  end
  
  it "should only fill first name on creation if given one name" do
    client = Client.find_or_create_by_name("Samuel")
    client.first_name.should == "Samuel"
    client.last_name.should be_blank
  end
  
  it "should find clients that only have a first name" do
    existing_client = Factory(:client, :name => "James")
    client = Client.find_or_create_by_name("James")
    client.should == existing_client
  end
end

