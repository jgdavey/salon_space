class AddDurationToAppointments < ActiveRecord::Migration
  def self.up
    add_column :appointments, :duration, :integer
  end

  def self.down
    remove_column :appointments, :duration
  end
end
