class AddJahrToRechnung < ActiveRecord::Migration
  def self.up
    add_column :rechnungs, :jahr, :string
  end

  def self.down
    remove_column :rechnungs, :jahr
  end
end
