class Contract::Base < ActiveRecord::Base
  set_table_name :contracts
  belongs_to :user

  PAYMENT_TERMS = ["Downpayment", "Escrow"]
end
