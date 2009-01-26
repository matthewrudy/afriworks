class AddStatusToContracts < ActiveRecord::Migration
  def self.up
    add_column :contracts, :status, :string, :null => false, :default => "draft"
    add_index  :contracts, :status # makes sense to have an index
  end

  def self.down
    remove_column :contracts, :status
  end
end
