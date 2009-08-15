class AddServicesToAppointments < ActiveRecord::Migration
  def self.up
    change_table :appointments do |t|
      t.references :service
    end
  end

  def self.down
    change_table :appointments do |t|
      t.remove :service_id
    end
  end
end
