class AddRechnungIdToAbrechnung < ActiveRecord::Migration
  def self.up
    add_column :abrechnungs, :rechnung_id, :integer
  end

  def self.down
    remove_column :abrechnungs, :rechnung_id
  end
end
