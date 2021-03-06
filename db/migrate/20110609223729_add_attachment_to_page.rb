class AddAttachmentToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :attachment_file_name, :string
    add_column :pages, :attachment_content_type, :string
    add_column :pages, :attachment_file_size, :integer
    add_column :pages, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :pages, :attachment_updated_at
    remove_column :pages, :attachment_file_size
    remove_column :pages, :attachment_content_type
    remove_column :pages, :attachment_file_name
  end
end
