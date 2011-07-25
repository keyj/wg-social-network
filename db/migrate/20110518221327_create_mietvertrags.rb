class CreateMietvertrags < ActiveRecord::Migration
  def self.up
    create_table :mietvertrags do |t|
      t.integer :user_id
      t.integer :wg_id
      t.date :start
      t.date :ende
      t.float :miete

      t.timestamps
    end
  end

  def self.down
    drop_table :mietvertrags
  end
end
