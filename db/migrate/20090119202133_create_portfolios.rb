class CreatePortfolios < ActiveRecord::Migration
  def self.up
    create_table :portfolios do |t|
      t.integer :provider_id
      t.string :title
      t.string :link

      t.string :example_file_name
      t.string :example_content_type
      t.integer :example_file_size
      t.datetime :example_updated_at

      t.timestamps
    end
    add_index :portfolios, :provider_id
  end

  def self.down
    drop_table :portfolios
  end
end
