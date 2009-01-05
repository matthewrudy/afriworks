class ChangePartnersToProviders < ActiveRecord::Migration
  def self.up
    rename_table :partners, :providers
  end

  def self.down
    rename_table :providers, :partners
  end
end
