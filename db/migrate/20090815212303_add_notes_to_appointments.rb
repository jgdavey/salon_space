class AddNotesToAppointments < ActiveRecord::Migration
  def self.up
    add_column :appointments, :notes, :text
  end

  def self.down
    remove_column :appointments, :notes
  end
end
