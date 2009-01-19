class AddShortNameToStaticPages < ActiveRecord::Migration
  def self.up
    add_column :static_pages, :short_name, :string
  end

  def self.down
    remove_column :static_pages, :short_name
  end
end
