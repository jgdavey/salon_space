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
  named_scope   :upcoming, lambda { |*args| {
    :conditions => ["time > ?", Time.now], 
    :limit => (args.first || 5)
    }}
  named_scope   :recent, lambda { |*args| {
    :conditions => ["time < ?", Time.now], 
    :limit => (args.first || 5)
    }}
  named_scope   :this_month, lambda { |*args| {
    :conditions => { :time => 1.month.ago..1.month.from_now }
  }}
  
  
  def pretty_time
    @pretty_time ||= time ? time.to_s(:pretty).gsub(/  /, ' ') : "Not scheduled yet"
  end
  
  def pretty_date
    @pretty_date ||= time ? time.to_date.to_s(:pretty).gsub(/  /, ' ') : "Not scheduled yet"
  end
  
  def client_name
    client && client.name
  end
  
  def client_name=(name)
    self.client = Client.find_or_create_by_name(name)
  end

end
