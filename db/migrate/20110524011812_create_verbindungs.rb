class CreateVerbindungs < ActiveRecord::Migration
  def self.up
    create_table :verbindungs do |t|
      t.string :msn_id
      t.integer :rechnung_id
      t.integer :verbindung_id
      t.string :datum_raw
      t.date :datum
      t.string :zeit_raw
      t.time :zeit
      t.string :laenge_raw
      t.integer :laenge
      t.string :nummer_raw
      t.string :nummer
      t.string :tarif_raw
      t.integer :tarif_id
      t.string :betrag_raw
      t.decimal :betrag

      t.timestamps
    end
  end

  def self.down
    drop_table :verbindungs
  end
end
