class CreateRechnungs < ActiveRecord::Migration
  def self.up
    create_table :rechnungs do |t|
      t.string :rechnungsnummer
      t.date :rechnungsdatum
      t.integer :wg_id
      t.integer :status_id
      t.integer :provider_id
      t.text :logs

      t.timestamps
    end
  end

  def self.down
    drop_table :rechnungs
  end
end
