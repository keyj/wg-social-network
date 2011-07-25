class AddRechnungsmonatToRechnung < ActiveRecord::Migration
  def self.up
    add_column :rechnungs, :rechnungsmonat, :string
    add_column :rechnungs, :kundennummer, :string
  end

  def self.down
    remove_column :rechnungs, :kundennummer
    remove_column :rechnungs, :rechnungsmonat
  end
end
