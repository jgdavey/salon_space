Given /^I have a client named "([^\"]*)"$/ do |name|
  Factory(:client, :name => name)
end

When /^I select "([^\"]*)" as the guest$/ do |arg1|
  pending
end

