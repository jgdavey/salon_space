
Factory.define :user do |f|  
  f.email "foo@example.com"  
  f.password "foobar"
  f.password_confirmation { |u| u.password }  
end

Factory.define :client do |f|
  f.name "Jane Doe"
end