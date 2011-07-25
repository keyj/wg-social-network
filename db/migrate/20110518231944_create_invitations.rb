class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.string :name
      t.string :facebookuid
      t.string :email
      t.string :secret
      t.integer :sent_by
      t.string :to_email
      t.integer :status
			t.integer :wg_id

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
