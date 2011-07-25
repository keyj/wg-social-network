class AddFileToRechnung < ActiveRecord::Migration
  def self.up
    add_column :rechnungs, :rechnungsdatei_file_name, :string
    add_column :rechnungs, :rechnungsdatei_content_type, :string
    add_column :rechnungs, :rechnungsdatei_file_size, :integer
    add_column :rechnungs, :rechnungsdatei_updated_at, :datetime
    add_column :rechnungs, :verbindungendatei_file_name, :string
    add_column :rechnungs, :verbindungendatei_content_type, :string
    add_column :rechnungs, :verbindungendatei_file_size, :integer
    add_column :rechnungs, :verbindungendatei_updated_at, :datetime
  end

  def self.down
    remove_column :rechnungs, :verbindungendatei_updated_at
    remove_column :rechnungs, :verbindungendatei_file_size
    remove_column :rechnungs, :verbindungendatei_content_type
    remove_column :rechnungs, :verbindungendatei_file_name
    remove_column :rechnungs, :rechnungsdatei_updated_at
    remove_column :rechnungs, :rechnungsdatei_file_size
    remove_column :rechnungs, :rechnungsdatei_content_type
    remove_column :rechnungs, :rechnungsdatei_file_name
  end
end
