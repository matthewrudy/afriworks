class BuildIndexes < ActiveRecord::Migration
  def self.up
    add_index :testimonials, :provider_id
    add_index :contracts,    :proposal_id
    add_index :contracts,    :user_id
  end

  def self.down
    remove_index :testimonials, :provider_id
    remove_index :contracts,    :proposal_id
    remove_index :contracts,    :user_id
  end
end
