class CreateWgs < ActiveRecord::Migration
  def self.up
    create_table :wgs do |t|
      t.string :name
      t.text :beschreibung
      t.text :adresse

      t.timestamps
    end
  end

  def self.down
    drop_table :wgs
  end
end
