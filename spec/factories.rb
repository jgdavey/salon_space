
Factory.define :user do |f|  
  f.email "foo@example.com"  
  f.password "foobar"
  f.password_confirmation { |u| u.password }  
end

Factory.define :client do |f|
  f.name "Jane Doe"
  f.address "123 South Lane\nAnderson, IN 46012"
  f.phone "123-123-1234"
  f.phone_type "mobile"
end