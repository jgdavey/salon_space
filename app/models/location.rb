class Location < ActiveRecord::Base
  has_many :appointments
end
