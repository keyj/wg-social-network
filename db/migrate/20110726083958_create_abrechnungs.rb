class CreateAbrechnungs < ActiveRecord::Migration
  def self.up
    create_table :abrechnungs do |t|
      t.integer :user_id
      t.text :mail
      t.boolean :bezahlt

      t.timestamps
    end
  end

  def self.down
    drop_table :abrechnungs
  end
end
