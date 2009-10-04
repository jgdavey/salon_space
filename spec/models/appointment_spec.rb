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
  
  it "should have a pretty date" do
    appt = Factory(:appointment)
    appt.time = "2009-01-01".to_time
    appt.time.to_date.to_s(:pretty).should eql("Thursday January  1, 2009")
    appt.pretty_date.should eql("Thursday January 1, 2009")
    appt.pretty_time.should eql("Thursday January 1, 2009 at 12:00 AM")
  end
  
  it "should deliver results in date ascending order" do
    appt2 = Factory(:appointment, :time => 2.days.from_now)
    appt1 = Factory(:appointment, :time => 1.day.from_now)
    appt3 = Factory(:appointment, :time => 3.days.from_now)
    Appointment.all.should eql([appt1,appt2,appt3])
  end
  
  it "should have an easy way to access appts with no one scheduled" do
    appt1 = Factory(:appointment, :time => 2.days.from_now, :client => nil)
    appt2 = Factory(:appointment, :time => 3.days.from_now)
    Appointment.needing_client.should include(appt1)
    Appointment.needing_client.should_not include(appt2)
  end

  describe "#client_name" do
    before(:each) do
      @jim = Factory(:client, :name => "Jim Davey")
      @dave = Factory(:client, :name => "Dave Jones")
    end
    
    it "should assign based on first and last name" do
      a = Appointment.new
      a.client.should be_nil
      a.client_name = "Jim Davey"
      a.client.should eql(@jim)
    end
    
    it "should create a new if no client exists by that name" do
      Client.expects(:find).returns(nil)
      Client.expects(:create!).returns(bob = Factory(:client,:name => "Bobby Brown"))
      a = Appointment.new
      a.client_name = "Bobby Brown"
      a.client.should == bob
    end
  end
end
