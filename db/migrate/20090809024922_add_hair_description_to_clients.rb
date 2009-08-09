class AddHairDescriptionToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :hair_description, :text
  end

  def self.down
    remove_column :clients, :hair_description
  end
end
