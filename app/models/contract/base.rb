class Contract::Base < ActiveRecord::Base
  set_table_name :contracts
  belongs_to :user
end
