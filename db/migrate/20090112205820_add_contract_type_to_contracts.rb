class AddContractTypeToContracts < ActiveRecord::Migration
  def self.up
    add_column :contracts, :contract_type, :string
  end

  def self.down
    remove_column :contracts, :contract_type
  end
end
