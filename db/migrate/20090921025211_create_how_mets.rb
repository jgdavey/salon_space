class CreateHowMets < ActiveRecord::Migration
  def self.up
    create_table :how_mets do |t|
      t.string :name
      t.timestamps
    end
    
    change_table :clients do |t|
      t.references :how_met
    end
  end

  def self.down
    change_table :clients do |t|
      t.remove :how_met_id
    end
    drop_table :how_mets
  end
end
