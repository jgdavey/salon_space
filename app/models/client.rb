class Client < ActiveRecord::Base

  validates_format_of :phone, :with => /^(\d{3}-)?\d{3}-\d{4}$/, 
                              :message => "should be of format ###-###-####"

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
