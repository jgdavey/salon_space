Then /^I should see (?:these rows|this row)\:$/ do |table|
  table.diff!(table_at('table').to_a)
end

