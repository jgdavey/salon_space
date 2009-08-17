class Setting < ActiveRecord::Base
  def self.[](name)
    setting = self.find_by_name(name.to_s)
    setting && setting.value == 'false' ? false : setting
  end
  
  def self.[]=(name, value)
    setting = self[name.to_s]
    if setting
      setting.value = value.to_s
    else
      setting = self.new(:name => name.to_s, :value => value.to_s)
    end
    setting.save
  end
end
