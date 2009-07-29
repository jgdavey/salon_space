Given /^there are no users$/ do
  User.count.should be(0)
end

Given /^a user with email and password "(.*)\/(.*)"$/ do |e, p|
  Factory(:user, :email => e, :password => p)
end

Given /^the following authentications:$/ do |authentications|
  Authentication.create!(authentications.hashes)
end

Given /^I am logged in as "(.*)\/(.*)"$/ do |e, p|#
  visit login_path  
  fill_in "Email", :with => e
  fill_in "Password", :with => p
  click_button "Log in"
end
