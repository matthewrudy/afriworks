require 'test_helper'

class Contract::ProposalTest < ActiveSupport::TestCase

  test "validation - contract_type must be off our special list" do
    it = Contract::Proposal.new
    assert_equal false, it.save
    assert_equal "must be selected", it.errors.on(:contract_type)

    it.contract_type = "something not off the list"
    it.save
    assert_equal "must be selected", it.errors.on(:contract_type)

    Contract::Base.contract_types.each do |contract_type|
      it.contract_type = contract_type
      it.save
      assert_nil it.errors.on(:contract_type)
    end
  end

  test "validation - payment_terms must be off our special list" do
    it = Contract::Proposal.new
    assert_equal false, it.save
    assert_equal "must be selected", it.errors.on(:payment_terms)

    it.payment_terms = "something not off the list"
    it.save
    assert_equal "must be selected", it.errors.on(:payment_terms)

    Contract::Base.payment_terms.each do |term|
      it.payment_terms = term
      it.save
      assert_nil it.errors.on(:payment_terms)
    end
  end

  test "has_many :responses" do
    it = Contract::Proposal.new
    assert_equal 0, it.responses.size

    response = it.responses.build
    assert_instance_of Contract::Response, response
  end

  test "new records are in :draft state" do
    it = create_a_proposal
 
    assert_equal "draft", it.status
    assert_equal true,    it.draft?
    assert_equal false,   it.published?
  end

  test "a draft record can be :submit-ed for moderation" do
    it = create_a_proposal
    assert_equal "draft", it.status

    assert_equal true, it.submit!
    assert_equal "moderating", it.status
    assert_equal true, it.moderating?
    assert_equal false, it.draft?
  end

  test "the 'pending' named_scope grabs all :draft and :amend proposals" do
    draft = create_a_proposal
    assert_equal "draft", draft.status

    amend = create_a_proposal
    amend.status = "amend"
    amend.save!
    assert_equal true, amend.amend?

    moderating = create_a_proposal
    moderating.submit!
    assert_equal "moderating", moderating.status

    assert_equal \
      Contract::Proposal.find(:all, :conditions => {:status => ["amend", "draft"]}).sort_by(&:id),
      Contract::Proposal.pending.all.sort_by(&:id)
    
  end

  test ":status should be protected" do
    it = Contract::Proposal.new(:status => "published")
    assert_equal "draft", it.status # "draft" is default
  end
  
  def create_a_proposal
    record = Contract::Proposal.new(:contract_type => "Fixed fee", :payment_terms => "Escrow")
    assert_equal true, record.save, "it failed to save #{record.errors.full_messages.inspect}"

    return record
  end
end
