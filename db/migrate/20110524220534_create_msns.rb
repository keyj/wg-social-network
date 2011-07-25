class CreateMsns < ActiveRecord::Migration
  def self.up
    create_table :msns do |t|
      t.string :number
      t.string :msn_id
      t.integer :user_id
      t.text :bemerkungen

      t.timestamps
    end
  end

  def self.down
    drop_table :msns
  end
end
