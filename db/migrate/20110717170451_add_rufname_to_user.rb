class AddRufnameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :rufname, :string
  end

  def self.down
    remove_column :users, :rufname
  end
end
