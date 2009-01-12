class AddAttachmentsDocumentToContract < ActiveRecord::Migration
  def self.up
    add_column :contracts, :document_file_name,    :string
    add_column :contracts, :document_content_type, :string
    add_column :contracts, :document_file_size,    :integer
    add_column :contracts, :document_updated_at,   :datetime
  end

  def self.down
    remove_column :contracts, :document_file_name
    remove_column :contracts, :document_content_type
    remove_column :contracts, :document_file_size
    remove_column :contracts, :document_updated_at
  end
end
