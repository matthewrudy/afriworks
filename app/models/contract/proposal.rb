class Contract::Proposal < Contract::Base
  has_many :responses

  validates_inclusion_of :contract_type, :in => contract_types, :message => "must be selected"
  validates_inclusion_of :payment_terms, :in => payment_terms,  :message => "must be selected"
end