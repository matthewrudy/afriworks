class Contract::Proposal < Contract::Base
  has_many :responses, :class_name => "Contract::Response"

  validates_inclusion_of :contract_type, :in => contract_types, :message => "must be selected"
  validates_inclusion_of :payment_terms, :in => payment_terms,  :message => "must be selected"

  acts_as_state_machine :initial => :draft, :column => 'status'

  state :draft
  state :moderating
  state :amend
  state :published
  state :withdrawn

  named_scope :pending, :conditions => {:status => ["draft", "amend"]}
  named_scope :for_moderation, :conditions => {:status => "moderating"}
  named_scope :published, :conditions => {:status => "published"}

  event :submit do
    transitions :to => :moderating, :from => [:draft, :amend]
  end

  event :reject do
    transitions :to => :amend, :from => :moderating
  end

  event :approve do
    transitions :to => :published, :from => :moderating
  end

end
