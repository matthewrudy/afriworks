class Contract::Base < ActiveRecord::Base
  set_table_name :contracts
  belongs_to :user

  has_attached_file :document,
    :styles => { :large => "800x500>", :medium => "500x300>", :thumb => "200x150>" }
  def document_present?
    document_file_name?
  end
  
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

  validates_inclusion_of :contract_type, :in => contract_types, :message => "must be selected"
  validates_inclusion_of :payment_terms, :in => payment_terms,  :message => "must be selected"
end
