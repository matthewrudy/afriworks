class Contract::Base < ActiveRecord::Base
  set_table_name :contracts
  belongs_to :user

  has_attached_file :document,
    :styles => { :large => "800x500>", :medium => "500x300>", :thumb => "200x150>" }

  PAYMENT_TERMS = [
    ["Downpayment", "Some informative text about downpayment"],
    ["Escrow",      "Some informative text about Escrow"],
  ].freeze
  def self.payment_terms
    PAYMENT_TERMS.map{|term, description| term}
  end
  def self.payment_terms_with_description
    PAYMENT_TERMS
  end
  validates_inclusion_of :payment_terms, :in => payment_terms, :message => "must be selected"
end
