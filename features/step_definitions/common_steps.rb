Then /^I should see (?:these rows|this row)\:$/ do |table|
  table.diff!(table_at('table').to_a)
end

Given /^(?:I have )the following ([\w\s_]+) records?:?$/ do |model, table|
  table.hashes.each do |row|
    Factory.create(model, row)
  end
end