# == Schema Information
# Schema version: 20090809040942
#
# Table name: appointments
#
#  id         :integer         not null, primary key
#  time       :datetime
#  client_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :service
  belongs_to :location
  default_scope :order => 'time ASC'
  named_scope   :needing_client, :conditions => {:client_id => nil}

  def pretty_time
    @pretty_time ||= time.to_s(:pretty).gsub(/  /, ' ')
  end
  
  def pretty_date
    @pretty_date ||= time.to_date.to_s(:pretty).gsub(/  /, ' ')    
  end

end
