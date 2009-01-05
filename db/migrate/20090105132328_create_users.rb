class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :full_name
      t.string :email_address
      t.string :openid
      t.string :password
      t.string :salt
      t.integer :provider_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
