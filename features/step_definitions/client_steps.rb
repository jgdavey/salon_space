Given /^I have ([0-9]+) clients?$/ do |num|
  num.to_i.times { Factory(:client, :name => "Jane Example_#{num}") }
end

Given /^I have no clients$/ do
  Client.count.should == 0
end

Given /^the following clients:$/ do |table|
  table.hashes.each do |row|
    Client.create!(:name => row['name'])
  end
end

Then /^I should have ([0-9]+) clients?$/ do |num|
  Client.count.should == num.to_i
end



