class AddResponsesCountToContracts < ActiveRecord::Migration
  def self.up
    add_column :contracts, :responses_count, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :contracts, :responses_count
  end
end
