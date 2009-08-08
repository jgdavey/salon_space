# == Schema Information
# Schema version: 20090801215939
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#  phone      :string(255)
#  phone_type :string(255)
#  email      :string(255)
#  address    :string(255)
#  last_name  :string(255)
#  notes      :text
#  birthdate  :date
#

class Client < ActiveRecord::Base

  validates_format_of :phone, :with    => /^(\d{3}-)?\d{3}-\d{4}$/, 
                              :message => "should be of format ###-###-####",
                              :unless  => 'phone.blank?'

  validates_format_of :email, :with    => Authlogic::Regex.email,
                              :unless  => 'email.blank?'

  def name
    @name ||= [first_name, last_name].compact.join(' ')
  end
  
  def name=(_name)
    self.first_name, self.last_name = _name.split(' ')
    self.name
  end

  def self.find_by_name(_name)
    fn, ln = _name.split(' ')
    self.find_by_first_name_and_last_name(fn, ln)
  end

end
