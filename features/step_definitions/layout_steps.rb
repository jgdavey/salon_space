Given /^the following layouts:$/ do |layouts|
  Layout.create!(layouts.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) layout$/ do |pos|
  visit layouts_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following layouts:$/ do |expected_layouts_table|
  expected_layouts_table.diff!(table_at('table').to_a)
end
