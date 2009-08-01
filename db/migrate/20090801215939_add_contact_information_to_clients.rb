class AddContactInformationToClients < ActiveRecord::Migration
  def self.up
    change_table :clients do |t|
      t.rename :name, :first_name
      t.string :phone, :phone_type, :email, :address, :last_name
      t.text :notes
      t.date :birthdate
    end
  end

  def self.down
    change_table :clients do |t|
      t.rename :first_name, :name
      t.remove :birthdate
      t.remove :notes
      t.remove :phone, :phone_type, :email, :address, :last_name
    end
  end
end
