class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :teaser
      t.text :content
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
