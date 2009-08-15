class AddLocationToAppointments < ActiveRecord::Migration
  def self.up
    change_table :appointments do |t|
      t.references :location
    end
  end

  def self.down
    change_table :appointments do |t|
      t.remove :location_id
    end
  end
end
