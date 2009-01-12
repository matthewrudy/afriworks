class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.string :title
      t.string :type
      t.string :payment_terms
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
