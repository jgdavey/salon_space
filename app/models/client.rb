# == Schema Information
# Schema version: 20090809024922
#
# Table name: clients
#
#  id               :integer         not null, primary key
#  first_name       :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  phone            :string(255)
#  phone_type       :string(255)
#  email            :string(255)
#  address          :string(255)
#  last_name        :string(255)
#  notes            :text
#  birthdate        :date
#  hair_description :text
#

class Client < ActiveRecord::Base
  belongs_to :how_met

  validates_format_of :phone, :with    => /^(\d{3}-)?\d{3}-\d{4}$/, 
                              :message => "should be of format ###-###-####",
                              :unless  => 'phone.blank?'

  validates_format_of :email, :with    => Authlogic::Regex.email,
                              :unless  => 'email.blank?'

  def name
    @name ||= [first_name, last_name].compact.join(' ')
  end
  
  def name=(_name)
    name_parts = _name.split(' ')
    self.first_name, self.last_name = name_parts.first, name_parts[1..-1].join(" ")
    self.name
  end

  def self.find_by_name(_name)
    name_parts = _name.split(' ')
    fn, ln = name_parts.first, name_parts[1..-1].join(" ")
    self.find_by_first_name_and_last_name(fn, ln)
  end
  
  def self.find_or_create_by_name(_name)
    client = self.find_by_name(_name)
    return client if client
    self.create!(:name => _name)
  end

end
