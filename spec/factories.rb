
Factory.define :user do |f|  
  f.email     "foo@example.com"  
  f.password  "foobar"
  f.password_confirmation { |u| u.password }  
end

Factory.define :client do |f|
  f.name       "Jane Doe"
  f.email      "myclient@example.com"
  f.address    "123 South Lane\nAnderson, IN 46012"
  f.phone      "123-123-1234"
  f.phone_type "mobile"
  f.birthdate  2.days.ago
  f.notes      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
end

Factory.define :appointment do |f|
  f.time        1.day.ago
  f.association :client
  f.association :service
  f.association :location
end

Factory.define :service do |f|
  f.name "Haircut"
end

Factory.define :location do |f|
  f.name "Fake Location"
end

Factory.define :setting do |f|
  f.name  "signup_enabled"
  f.value "false"
end