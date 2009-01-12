class Contract::Base < ActiveRecord::Base
  set_table_name :contracts
  belongs_to :user

  has_attached_file :document,
    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  PAYMENT_TERMS = ["Downpayment", "Escrow"]
end
