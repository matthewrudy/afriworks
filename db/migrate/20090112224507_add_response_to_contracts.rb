class AddResponseToContracts < ActiveRecord::Migration
  def self.up
    add_column :contracts, :proposal_id, :integer
  end

  def self.down
    remove_column :contracts, :proposal_id
  end
end
