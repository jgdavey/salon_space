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
end
