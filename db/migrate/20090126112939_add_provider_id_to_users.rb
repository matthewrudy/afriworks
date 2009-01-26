class AddProviderIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :provider_id, :integer, :null => true, :default => nil
    add_index  :users, :provider_id  # gets us partition
  end

  def self.down
    remove_column :users, :provider_id
  end
end
