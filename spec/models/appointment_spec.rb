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

require File.dirname(__FILE__) + '/../spec_helper'

describe Appointment do
  it "should be valid" do
    Appointment.new.should be_valid
  end
end
