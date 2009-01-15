class Contract::Base < ActiveRecord::Base
  set_table_name :contracts
  belongs_to :user

  has_attached_file :document,
    :styles => { :large => "800x500>", :medium => "500x300>", :thumb => "200x150>" }
  
  CONTRACT_TYPES = ["Fixed fee", "Hourly rate", "To Be Determined"].freeze
  PAYMENT_TERMS = [
    ["Downpayment", "Some informative text about downpayment"],
    ["Escrow",      "Some informative text about Escrow"],
  ].freeze
  def self.contract_types
    CONTRACT_TYPES
  end
  def self.payment_terms
    PAYMENT_TERMS.map{|term, description| term}
  end
  def self.payment_terms_with_description
    PAYMENT_TERMS
  end
end
require_dependency "contract/proposal"
require_dependency "contract/response"
